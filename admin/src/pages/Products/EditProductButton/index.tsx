import React, { useState } from "react";

import { EditIcon } from "../../../Icons";

// types
import { IProduct } from "../../../types";
import Form from "./Form";

interface Props {
  product: IProduct;
}

function EditButton({ product }: Props) {
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
        className="text-gray-500 transition-colors duration-200 hover:text-yellow-500 focus:outline-none"
      >
        <EditIcon />
      </button>
      {visible && <Form product={product} handleClose={handleClose} />}
    </>
  );
}

export default EditButton;
