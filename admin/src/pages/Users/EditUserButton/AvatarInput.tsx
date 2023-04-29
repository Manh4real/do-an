import React, { useEffect, useState } from "react";

import { useEditFormStore } from "../../../store/editForm";
import { compressImage } from "../../../helpers";

interface Props {
  url: string;
}
function AvatarInput({ url }: Props) {
  const { updateData } = useEditFormStore();
  const [imageFile, setImageFile] = useState<File | null>(null);

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (!e.target.files) return;

    const file = e.target.files[0];
    setImageFile(file);

    compressImage(file, 1, 0.1, (blob) => {
      console.log(
        "Compressed image file and ready to upload (Size: " + blob.size + ")"
      );
      updateData({
        avatar: {
          value: blob,
          isValid: true,
        },
      });
    });
  };

  // to display image
  const imageUrl = (imageFile && URL.createObjectURL(imageFile)) || url;
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
      {!imageUrl && <ChooseFileSection handleChange={handleChange} />}
      {imageUrl && (
        <ShowAvatarSection imageUrl={imageUrl} handleChange={handleChange} />
      )}
    </div>
  );
}

interface IProps {
  handleChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  imageUrl: string | null;
}
const ChooseFileSection = ({ handleChange }: Omit<IProps, "imageUrl">) => {
  return (
    <label
      htmlFor="file-upload"
      className="hover:bg-gray-50 cursor-pointer mt-2 flex justify-center rounded-lg border border-dashed border-gray-900/25 px-6 py-10"
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

const ShowAvatarSection = ({ imageUrl, handleChange }: IProps) => {
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

export default AvatarInput;
