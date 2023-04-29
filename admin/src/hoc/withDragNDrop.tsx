import React, { useState } from "react";

// DRAG AND DROP SINGLE FILE

export interface IWithDragNDrop {
  //   isFileOver: boolean;
  file: File | null;
  handleChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  dragAndDropHandlers: {
    handleDrop: React.DragEventHandler;
    handleDragOver: React.DragEventHandler;
    handleDragLeave: React.DragEventHandler;
    handleDragEnter: React.DragEventHandler;
  };
}

function withDragNDrop<T extends IWithDragNDrop>(
  Component: React.ComponentType<T>
) {
  const WrappedComponent = (props: Omit<T, keyof IWithDragNDrop>) => {
    const [file, setFile] = useState<File>();
    // const [isFileOver, setIsFileOver] = useState(false);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
      if (!e.target.files) return;

      setFile(e.target.files[0]);
    };
    const handleDrop = <T extends HTMLElement>(e: React.DragEvent<T>) => {
      console.log("File(s) dropped");
      e.preventDefault();

      //   isFileOver && setIsFileOver(false);

      if (e.dataTransfer.items) {
        // Use DataTransferItemList interface to access the file(s)
        const items = Array.from(e.dataTransfer.items);

        // If more than 1 items, reject
        if (items.length > 1) return;

        const firstItem = items[0];

        // If dropped item isn't file, reject it
        if (firstItem.kind === "file") {
          const file = firstItem.getAsFile();

          if (file && !isFileImage(file)) {
            console.log(
              "%cAvatar must be type of PNG, JPG, JPEG, GIF",
              "color: #f28080;"
            );
            return;
          }
          if (file && isFileImage(file)) setFile(file);
        }
      } else {
        // Use DataTransfer interface to access the file(s)
        const files = Array.from(e.dataTransfer.files);

        // If more than 1 file, reject
        if (files.length > 1) return;

        const firstFile = files[0];

        if (isFileImage(firstFile)) setFile(firstFile);
        else console.log("Avatar must be type of PNG, JPG, JPEG, GIF");
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
        file={file}
        handleChange={handleChange}
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

export default withDragNDrop;
