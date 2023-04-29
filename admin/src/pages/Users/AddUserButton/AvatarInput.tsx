import React, { useEffect } from "react";

import { useAddFormStore } from "../../../store/addForm";
import { compressImage } from "../../../helpers";

import withDragNDrop, { IWithDragNDrop } from "../../../hoc/withDragNDrop";

function AvatarInput({
  file,
  // isFileOver,
  handleChange: _handleChange,
  dragAndDropHandlers,
}: IWithDragNDrop) {
  // const [imageFile, setImageFile] = useState<File>();

  const { updateData } = useAddFormStore();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    // const selectedFile = e.target.files[0];
    // setImageFile(file);
    _handleChange(e);

    if (!e.target.files) return;
    if (!e.target.files[0]) return;

    compressImage(e.target.files[0], 1, 0.1, (blob) => {
      updateData({
        avatar: {
          value: blob,
          isValid: true,
        },
      });
    });
  };

  const imageUrl = file && URL.createObjectURL(file);
  useEffect(() => {
    return () => {
      imageUrl && URL.revokeObjectURL(imageUrl);
    };
  }, [imageUrl]);

  return (
    <div className="col-span-full">
      <label
        htmlFor="cover-photo"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Avatar
      </label>
      {!imageUrl && (
        <ChooseFileSection
          // isFileOver={isFileOver}
          dragAndDropHandlers={dragAndDropHandlers}
          handleChange={handleChange}
        />
      )}
      {imageUrl && (
        <ShowAvatarSection imageUrl={imageUrl} handleChange={handleChange} />
      )}
    </div>
  );
}

type IProps = {
  handleChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  imageUrl: string | null;
  // isFileOver: IWithDragNDrop["isFileOver"];
  dragAndDropHandlers: IWithDragNDrop["dragAndDropHandlers"];
};
const ChooseFileSection = ({
  handleChange,
  // isFileOver,
  dragAndDropHandlers,
}: Omit<IProps, "imageUrl">) => {
  // const isFileOverClasses = isFileOver ? "border-indigo-900 bg-gray-50" : "";

  return (
    <label
      onDragOver={dragAndDropHandlers.handleDragOver}
      onDrop={dragAndDropHandlers.handleDrop}
      onDragLeaveCapture={dragAndDropHandlers.handleDragLeave}
      onDragEnterCapture={dragAndDropHandlers.handleDragEnter}
      htmlFor="file-upload"
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
            <span>Upload a file</span>
            <input
              onChange={handleChange}
              id="file-upload"
              name="file-upload"
              type="file"
              className="sr-only"
              accept="image/png, image/jpg, image/gif"
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

const ShowAvatarSection = ({
  imageUrl,
  handleChange,
}: Omit<IProps, "dragAndDropHandlers" | "isFileOver">) => {
  return (
    <div className="col-span-full">
      <div className="mt-4 flex items-center gap-x-3">
        {imageUrl && (
          <img
            className="ring-1 ring-gray-200 shadow-md object-cover w-20 h-20 rounded-full"
            src={imageUrl}
            alt=""
          />
        )}
        <label
          htmlFor="imageFile"
          role="button"
          className="rounded-md bg-white px-4 py-2 text-sm font-semibold text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 hover:bg-gray-50"
        >
          Change
        </label>
        <input
          onChange={handleChange}
          type="file"
          name="imageFile"
          id="imageFile"
          accept="image/png, image/jpg, image/jpeg, image/gif"
          className="hidden"
        />
      </div>
    </div>
  );
};

export default withDragNDrop(AvatarInput);
