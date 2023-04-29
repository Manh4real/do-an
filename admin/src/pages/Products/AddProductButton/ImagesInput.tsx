import React, { useEffect, useState } from "react";

import { useAddFormStore } from "../../../store/product/addForm";
import { CloseIcon, Plus } from "../../../Icons";
import Spinner from "../../../components/Spinner";

import withDragNDropFiles, {
  IWithDragNDrop,
} from "../../../hoc/withDragNDropFiles";

import { compressImage } from "../../../helpers";

interface Props extends IWithDragNDrop {
  color: string;
  colorId: string;
}
function ImagesInput({
  dragAndDropHandlers,
  files,
  handleChange: _handleChange,
  handleRemoveImage: _handleRemoveImage,
  color,
  colorId,
}: Props) {
  const [loading, setLoading] = useState(false);

  const { data, updateData } = useAddFormStore();

  const handleRemoveImage = (index: number) => {
    _handleRemoveImage(index, removeFiles);
  };

  const removeFiles = (index: number) => {
    const blobs = [...data.images.value[colorId]];
    blobs.splice(index, 1);

    updateData({
      images: {
        value: {
          ...data.images.value,
          [colorId]: blobs,
        },
        isValid: blobs.length > 0,
      },
    });
  };

  const updateFiles = (selectedFiles: File[]) => {
    let list: (Blob | File)[] = [];
    const length = selectedFiles.length;
    let j = 0;

    const onToBlobSuccess = (blob: Blob) => {
      j++;
      list.push(blob);

      if (j === length) {
        const blobs = !data.images.value[colorId]
          ? list
          : [...data.images.value[colorId], ...list];

        updateData({
          images: {
            value: {
              ...data.images.value,
              [colorId]: blobs,
            },
            isValid: blobs.length > 0,
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

  const imageUrls = files.map((imageFile) => URL.createObjectURL(imageFile));

  useEffect(() => {
    return () => {
      imageUrls &&
        imageUrls.forEach((imageUrl) => {
          URL.revokeObjectURL(imageUrl);
        });
    };
  }, [imageUrls]);

  return (
    <div className="col-span-full mt-4">
      <label
        htmlFor="cover-photo"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Images of product in color {color}
      </label>
      {imageUrls.length <= 0 && (
        <ChooseFileSection
          color={color}
          colorId={colorId}
          setLoading={setLoading}
          updateFiles={updateFiles}
          dragAndDropHandlers={dragAndDropHandlers}
          handleChange={handleChange}
        />
      )}
      {imageUrls.length > 0 && loading && <Spinner />}
      {imageUrls.length > 0 && !loading && (
        <ShowAvatarSection
          color={color}
          imageUrls={imageUrls}
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
  imageUrls: (string | null)[];
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
}
const ShowAvatarSection = ({
  color,
  imageUrls,
  handleChange,
  handleRemoveImage,
}: ShowAvatar) => {
  return (
    <div className="col-span-full">
      <div className="mt-2">
        {imageUrls.length > 0 && (
          <div className="flex gap-4 flex-wrap mt-3 min-h-[75px]">
            {imageUrls.map((imageUrl: string | null, i) => {
              return (
                <div key={i} className="relative">
                  {imageUrl && (
                    <React.Fragment>
                      <img
                        className="ring-1 ring-gray-200 shadow-md object-cover w-20 h-20 rounded-lg"
                        src={imageUrl}
                        alt=""
                      />
                      <div
                        onClick={() => {
                          handleRemoveImage(i);
                        }}
                        className="absolute z-10 top-0 right-0 w-6 h-6 bg-gray-200 shadow-md ring-1 ring-gray-400 translate-x-1/2 -translate-y-1/2 rounded-full flex items-center justify-center cursor-pointer"
                      >
                        <CloseIcon />
                      </div>
                    </React.Fragment>
                  )}
                </div>
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

export default withDragNDropFiles(ImagesInput);
