import React, { useState } from "react";

export interface IWithDragNDrop {
  files: File[];
  handleChange: (
    e: React.ChangeEvent<HTMLInputElement>,
    cb: (changedFiles: File[]) => void
  ) => void;
  handleRemoveImage: (
    index: number,
    cb: (index: number) => void,
    type?: ImageUploadType
  ) => void;
  dragAndDropHandlers: {
    handleDrop: (
      e: React.DragEvent,
      cb: (changedFiles: File[]) => void
    ) => void;
    handleDragOver: React.DragEventHandler;
    handleDragLeave: React.DragEventHandler;
    handleDragEnter: React.DragEventHandler;
  };
}

enum ImageUploadType {
  SAVED = "saved-to-db",
  NEW_ADDED = "prepared-to-save",
}
function withDragNDropFiles<T extends IWithDragNDrop>(
  Component: React.ComponentType<T>
) {
  const WrappedComponent = (props: Omit<T, keyof IWithDragNDrop>) => {
    const [files, setFiles] = useState<File[]>([]);

    const handleRemoveImage = (
      index: number,
      cb: (index: number) => void,
      type: ImageUploadType = ImageUploadType.NEW_ADDED
    ) => {
      if (type === ImageUploadType.NEW_ADDED) {
        setFiles((prev) => {
          const temp = [...prev];
          temp.splice(index, 1);
          return temp;
        });
      }

      cb(index);
    };

    const handleChange = (
      e: React.ChangeEvent<HTMLInputElement>,
      cb: (changedFiles: File[]) => void
    ) => {
      if (!e.target.files) return;

      const fileList = e.target.files;
      const selectedFiles: File[] = [];

      for (let i = 0; i < fileList.length; i++) {
        selectedFiles.push(fileList[i]);
      }

      setFiles((prev) => [...prev, ...selectedFiles]);
      cb(selectedFiles);
    };
    const handleDrop = <T extends HTMLElement>(
      e: React.DragEvent<T>,
      cb: (changedFiles: File[]) => void
    ) => {
      console.log("File(s) dropped");
      e.preventDefault();

      if (e.dataTransfer.items) {
        // Use DataTransferItemList interface to access the file(s)
        const items = Array.from(e.dataTransfer.items);
        const fileList: File[] = [];

        for (let i = 0; i < items.length; i++) {
          const item = items[i];

          // If dropped item isn't file, reject it
          if (item.kind === "file") {
            const file = item.getAsFile();

            if (file && !isFileImage(file)) {
              console.log(
                "%cAvatar must be type of PNG, JPG, JPEG, GIF",
                "color: #f28080;"
              );
              return;
            }
            if (file && isFileImage(file)) fileList.push(file);
          }
        }

        setFiles((prev) => [...prev, ...fileList]);
        cb(fileList);
      } else {
        // Use DataTransfer interface to access the file(s)
        const files = Array.from(e.dataTransfer.files);
        const fileList: File[] = [];

        for (let i = 0; i < files.length; i++) {
          const file = files[0];

          if (isFileImage(file)) fileList.push(file);
          else console.log("Avatar must be type of PNG, JPG, JPEG, GIF");
        }

        setFiles((prev) => [...prev, ...fileList]);
        cb(fileList);
      }
    };
    const handleDragOver = <T extends HTMLElement>(e: React.DragEvent<T>) => {
      console.log("File(s) in drop zone");
      e.preventDefault();

      //   !isFileOver && setIsFileOver(true);
    };
    const handleDragLeave = <T extends HTMLElement>(e: React.DragEvent<T>) => {
      //   setIsFileOver(false);
    };
    const handleDragEnter = <T extends HTMLElement>(e: React.DragEvent<T>) => {
      //   setIsFileOver(true);
    };

    const dragAndDropHandlers = {
      handleDrop,
      handleDragOver,
      handleDragLeave,
      handleDragEnter,
    };

    return (
      <Component
        {...(props as T)}
        // isFileOver={isFileOver}
        files={files}
        handleChange={handleChange}
        handleRemoveImage={handleRemoveImage}
        dragAndDropHandlers={dragAndDropHandlers}
      />
    );
  };

  return WrappedComponent;
}

function isFileImage(file: File) {
  const acceptedImageTypes = [
    "image/gif",
    "image/jpeg",
    "image/png",
    "image/jpg",
  ];

  return file && acceptedImageTypes.includes(file["type"]);
}

export default withDragNDropFiles;
