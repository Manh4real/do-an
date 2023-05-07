import React, { useState } from "react";
import Form from "./Form";
import { useAddFormStore } from "../../../store/product_type/addForm";
import { Plus } from "../../../Icons";

function AddProductTypeButton() {
  const [visible, setVisible] = useState(false);

  const addFormStore = useAddFormStore();

  const handleOpen = () => {
    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);

    addFormStore.reset();
  };

  return (
    <>
      <button
        onClick={handleOpen}
        className="flex items-center gap-2 rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
      >
        <Plus />
        Add new product type
      </button>
      {visible && <Form handleClose={handleClose} />}
    </>
  );
}

export default AddProductTypeButton;
