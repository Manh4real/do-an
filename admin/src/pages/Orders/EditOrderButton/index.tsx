import React, { useState } from "react";
import { EditIcon } from "../../../Icons";
import Form from "./Form";

import { IOrder } from "../../../types";

interface Props {
  order: IOrder;
}

function EditOrderButton({ order }: Props) {
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
      {visible && <Form order={order} handleClose={handleClose} />}
    </>
  );
}

export default EditOrderButton;
