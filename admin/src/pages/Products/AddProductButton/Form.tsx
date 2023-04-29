import React, { useState } from "react";

import { useAddFormStore } from "../../../store/product/addForm";

import Modal from "../../../components/Modal";

import ProductTypeInput from "./ProductTypeInput";
import ProductNameInput from "./ProductNameInput";
import CategoryInput from "./CategoryInput";
import GenderInput from "./GenderInput";
import TargetInput from "./TargetInput";
import ProductStyleInput from "./ProductStyleInput";
import PriceInput from "./PriceInput";
import DescriptionInput from "./DescriptionInput";
import ManufacturerInput from "./ManufacturerInput";
import ColorInput from "./ColorInput";

import { createNewProduct } from "../../../services/products";
import { useRefreshContext } from "../../../context";

interface Props {
  handleClose: () => void;
}

function Form({ handleClose }: Props) {
  const { data, isAllValid: _isAllValid, getAll } = useAddFormStore();

  const isAllValid = _isAllValid();
  const { reset } = useAddFormStore();

  const [loading, setLoading] = useState(false);
  const refreshContext = useRefreshContext();

  console.log(data);

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!data) return;

    console.log(getAll());
    setLoading(true);

    const d = getAll();

    createNewProduct(d)
      .then(() => {
        handleClose();
        refreshContext.handleRefresh();
      })
      .finally(() => {
        setLoading(false);
      });
  };

  return (
    <Modal large={true}>
      <p className="text-indigo-700 text-xl uppercase font-extrabold mb-5 text-center my-3">
        Add new product
      </p>

      <form onSubmit={handleSubmit}>
        <div className="space-y-12 mb-10">
          <div className="border-b border-gray-900/10 pb-12">
            <h2 className="text-base font-semibold leading-7 text-gray-900">
              Product Information
            </h2>
            <p className="mt-1 text-sm leading-6 text-gray-600">
              Describe the product so detailed that can make it easier for user
              to understand
            </p>

            <div className="mt-5 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
              <ProductNameInput />
              <ManufacturerInput />
              <ProductTypeInput />
              <CategoryInput />
              <GenderInput />

              <TargetInput />
              <ProductStyleInput />

              <PriceInput />

              <ColorInput />
              <DescriptionInput />
            </div>
          </div>
        </div>

        <div className="absolute z-20 bottom-0 left-0 right-0 bg-white border-t-2 border-t-gray-100 px-5 py-3 mt-6 flex items-center justify-end gap-x-6">
          <button
            type="button"
            disabled={loading}
            onClick={() => {
              handleClose();
              reset();
            }}
            className="text-sm font-semibold leading-6 text-gray-900"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={!isAllValid || loading}
            className=" disabled:bg-indigo-300 w-32 rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          >
            {loading ? "Processing..." : "Submit"}
          </button>
        </div>
      </form>
    </Modal>
  );
}

export default Form;
