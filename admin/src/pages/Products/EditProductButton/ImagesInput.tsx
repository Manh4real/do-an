import React, { useMemo, useEffect, useState } from "react";

import {
  IProductEditFormData,
  useEditFormStore,
} from "../../../store/product/editForm";
import { CloseIcon, Plus } from "../../../Icons";
import Spinner from "../../../components/Spinner";

import withDragNDropFiles, {
  IWithDragNDrop,
} from "../../../hoc/withDragNDropFiles";

import { compressImage } from "../../../helpers";
import { getDownloadImage } from "../../../features/firebase";

interface Props extends IWithDragNDrop {
  color: string;
  colorId: string;
}

enum ImageUploadType {
  SAVED = "saved-to-db",
  NEW_ADDED = "prepared-to-save",
}

function ImagesInput({
  dragAndDropHandlers,
  files,
  handleChange: _handleChange,
  handleRemoveImage: _handleRemoveImageFile,
  color,
  colorId,
}: Props) {
  const [loading, setLoading] = useState(false);

  const { data, updateData } = useEditFormStore();

  const handleRemoveImage = (
    index: number,
    type: ImageUploadType = ImageUploadType.NEW_ADDED
  ) => {
    _handleRemoveImageFile(index, removeFiles.bind(null, index, type), type);
  };

  const removeFiles = (
    index: number,
    type: ImageUploadType = ImageUploadType.NEW_ADDED
  ) => {
    if (data === null) return;
    if (!data.images.value[colorId] && !data.addedImages.value[colorId]) return;

    const updatedInfo: Pick<
      Partial<IProductEditFormData>,
      "images" | "addedImages" | "removedImages"
    > = {};

    if (type === ImageUploadType.SAVED) {
      if (data.images.value[colorId]) {
        const changed = { ...data.images.value };

        const previousSavedImages = [...data.images.value[colorId]];
        const removed = previousSavedImages.splice(index, 1);

        if (previousSavedImages.length === 0) {
          delete changed[colorId];
        } else {
          changed[colorId] = previousSavedImages;
        }

        updatedInfo.images = {
          value: changed,
          isValid: true,
        };

        const r = data.removedImages.value
          ? data.removedImages.value[colorId] || []
          : [];

        updatedInfo.removedImages = {
          value: {
            ...data.removedImages.value,
            [colorId]: [...r, ...removed],
          },
          isValid: true,
        };
      }
    } else if (type === ImageUploadType.NEW_ADDED) {
      if (data.addedImages.value[colorId]) {
        const addedImages = { ...data.addedImages.value };

        const addedImageBlobs = [...data.addedImages.value[colorId]];
        addedImageBlobs.splice(index, 1);

        if (addedImageBlobs.length === 0) {
          delete addedImages[colorId];
        } else {
          addedImages[colorId] = addedImageBlobs;
        }

        updatedInfo.addedImages = {
          value: addedImages,
          isValid: true,
        };

        updatedInfo.images = {
          value: data.images.value,
          isValid: false,
        };
      }
    }

    if (updatedInfo.images) {
      let c = !!updatedInfo.images.value[colorId];

      if (updatedInfo.addedImages?.value) {
        c = c || !!updatedInfo.addedImages.value[colorId];
      }

      updatedInfo.images.isValid = c;
    }
    updateData(updatedInfo);
  };

  const updateFiles = (selectedFiles: File[]) => {
    if (data === null) return;

    let list: (Blob | File)[] = [];
    const length = selectedFiles.length;
    let j = 0;

    const onToBlobSuccess = (blob: Blob) => {
      j++;
      list.push(blob);

      if (j === length) {
        const blobs = !data.addedImages.value[colorId]
          ? list
          : [...data.addedImages.value[colorId], ...list];

        updateData({
          addedImages: {
            value: {
              ...data.addedImages.value,
              [colorId]: blobs,
            },
            isValid: true,
          },
          images: {
            value: data.images.value,
            isValid:
              blobs.length > 0 &&
              !Object.values(data.images.value).some((i) => i.length === 0),
          },
        });

        setLoading(false);
      }
    };

    for (let i = 0; i < selectedFiles.length; i++) {
      compressImage(selectedFiles[i], 1, 0.5, onToBlobSuccess);
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    _handleChange(e, updateFiles);
  };

  const addedImageUrls = files.map((imageFile) =>
    URL.createObjectURL(imageFile)
  );
  const imageNames = useMemo(() => {
    return data === null
      ? []
      : data.images.value[colorId]?.map(({ url }) => url) || [];
  }, [colorId, data]);

  const [imageUrls, setImageUrls] = useState<string[]>([]);

  useEffect(() => {
    (async () => {
      const promises: Promise<string>[] = [];

      imageNames.forEach((url) => {
        promises.push(getDownloadImage(url));
      });

      const imagesResponse = await Promise.all(promises);

      setImageUrls(imagesResponse);
    })();
  }, [imageNames]);

  useEffect(() => {
    return () => {
      addedImageUrls &&
        addedImageUrls.forEach((imageUrl) => {
          URL.revokeObjectURL(imageUrl);
        });
    };
  }, [addedImageUrls]);

  // useEffect(() => {
  //   if (data === null) return;

  //   const images = data.images.value[Object.keys(data.images.value)[0]];
  // }, [data]);

  return (
    <div className="col-span-full mt-4">
      <label
        htmlFor="cover-photo"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Images of product in color {color}
      </label>
      {imageUrls.length <= 0 && addedImageUrls.length <= 0 && (
        <ChooseFileSection
          color={color}
          colorId={colorId}
          setLoading={setLoading}
          updateFiles={updateFiles}
          dragAndDropHandlers={dragAndDropHandlers}
          handleChange={handleChange}
        />
      )}
      {(imageUrls.length > 0 || addedImageUrls.length > 0) && loading && (
        <Spinner />
      )}
      {(imageUrls.length > 0 || addedImageUrls.length > 0) && !loading && (
        <ShowAvatarSection
          color={color}
          imageUrls={imageUrls}
          addedImageUrls={addedImageUrls}
          handleChange={handleChange}
          handleRemoveImage={handleRemoveImage}
        />
      )}
    </div>
  );
}

type IProps = {
  color: string;
  handleChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  imageUrls: string[];
};
interface ChooseFilesProps extends IProps {
  setLoading: React.Dispatch<React.SetStateAction<boolean>>;
  updateFiles: (selectedFiles: File[]) => void;
  colorId: string;
  dragAndDropHandlers: IWithDragNDrop["dragAndDropHandlers"];
}

const ChooseFileSection = ({
  handleChange,
  updateFiles,
  color,
  dragAndDropHandlers,
}: Omit<ChooseFilesProps, "imageUrls">) => {
  return (
    <label
      onDragOver={dragAndDropHandlers.handleDragOver}
      onDrop={(e) => {
        dragAndDropHandlers.handleDrop(e, updateFiles);
      }}
      htmlFor={"file-upload-" + color}
      className={
        "hover:bg-gray-50 cursor-pointer mt-2 flex justify-center rounded-lg border-2 border-dashed border-gray-900/25 px-6 py-10"
      }
    >
      <div className="text-center">
        <svg
          className="mx-auto h-12 w-12 text-gray-300"
          viewBox="0 0 24 24"
          fill="currentColor"
          aria-hidden="true"
        >
          <path
            fillRule="evenodd"
            d="M1.5 6a2.25 2.25 0 012.25-2.25h16.5A2.25 2.25 0 0122.5 6v12a2.25 2.25 0 01-2.25 2.25H3.75A2.25 2.25 0 011.5 18V6zM3 16.06V18c0 .414.336.75.75.75h16.5A.75.75 0 0021 18v-1.94l-2.69-2.689a1.5 1.5 0 00-2.12 0l-.88.879.97.97a.75.75 0 11-1.06 1.06l-5.16-5.159a1.5 1.5 0 00-2.12 0L3 16.061zm10.125-7.81a1.125 1.125 0 112.25 0 1.125 1.125 0 01-2.25 0z"
            clipRule="evenodd"
          />
        </svg>
        <div className="mt-4 flex text-sm leading-6 text-gray-600">
          <div className="relative cursor-pointer rounded-md font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500">
            <span>Upload images</span>
            <input
              onChange={handleChange}
              id={"file-upload-" + color}
              name="file-upload"
              type="file"
              className="sr-only"
              multiple
              accept="image/png, image/jpg, image/jpeg, image/gif"
            />
          </div>
          <p className="pl-1">or drag and drop</p>
        </div>
        <p className="text-xs leading-5 text-gray-600">
          PNG, JPG, GIF up to 10MB
        </p>
      </div>
    </label>
  );
};

interface ShowAvatar extends IProps {
  handleRemoveImage: (index: number) => void;
  addedImageUrls: string[];
}
const ShowAvatarSection = ({
  color,
  imageUrls,
  addedImageUrls,
  handleChange,
  handleRemoveImage,
}: ShowAvatar) => {
  return (
    <div className="col-span-full">
      <div className="mt-2">
        {(imageUrls.length > 0 || addedImageUrls.length > 0) && (
          <div className="flex gap-4 flex-wrap mt-3 min-h-[75px]">
            {imageUrls.map((imageUrl, i) => {
              return (
                <EditFormImage
                  key={imageUrl}
                  handleRemoveImage={handleRemoveImage.bind(
                    null,
                    i,
                    ImageUploadType.SAVED
                  )}
                  url={imageUrl}
                  // index={i}
                />
              );
            })}
            {addedImageUrls.map((addedImageUrl, i) => {
              return (
                <EditFormImage
                  key={i}
                  handleRemoveImage={handleRemoveImage.bind(
                    null,
                    i,
                    ImageUploadType.NEW_ADDED
                  )}
                  url={addedImageUrl}
                  // index={i}
                />
              );
            })}
          </div>
        )}
        <label
          htmlFor={"imageFile-" + color}
          role="button"
          className="whitespace-nowrap flex w-max mt-5 rounded-md bg-white px-4 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-100 focus-visible:outline-indigo-800"
        >
          <Plus /> Add more
        </label>
        <input
          onChange={handleChange}
          type="file"
          name="imageFile"
          id={"imageFile-" + color}
          accept="image/png, image/jpg, image/jpeg, image/gif"
          multiple
          className="hidden"
        />
      </div>
    </div>
  );
};

interface IEditFormImage {
  url: string;
  // index: number;
  handleRemoveImage: () => void;
}
const EditFormImage = ({ url, handleRemoveImage }: IEditFormImage) => {
  return (
    <div className="relative">
      {url && (
        <React.Fragment>
          <img
            className="ring-1 ring-gray-200 shadow-md object-cover w-20 h-20 rounded-lg"
            src={url}
            alt=""
          />
          <div
            onClick={() => {
              handleRemoveImage();
            }}
            className="absolute z-10 top-0 right-0 w-6 h-6 bg-gray-200 shadow-md ring-1 ring-gray-400 translate-x-1/2 -translate-y-1/2 rounded-full flex items-center justify-center cursor-pointer"
          >
            <CloseIcon />
          </div>
        </React.Fragment>
      )}
    </div>
  );
};

export default withDragNDropFiles(ImagesInput);
