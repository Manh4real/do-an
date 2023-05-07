import React, { useState } from "react";
import { EditIcon } from "../../../Icons";
import Form from "./Form";
import { IManufacturer } from "../../../types";

interface Props {
  manufacturer: IManufacturer;
}

function EditManufacturerButton({ manufacturer }: Props) {
  const [visible, setVisible] = useState(false);
  const handleOpen = () => {
    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);
  };

  return (
    <>
      <button
        onClick={handleOpen}
        className="flex items-center gap-2 text-gray-500 transition-colors duration-200 hover:text-yellow-500 focus:outline-none"
      >
        <EditIcon /> <span className="font-medium">Edit</span>
      </button>
      {visible && (
        <Form manufacturer={manufacturer} handleClose={handleClose} />
      )}
    </>
  );
}

export default EditManufacturerButton;
