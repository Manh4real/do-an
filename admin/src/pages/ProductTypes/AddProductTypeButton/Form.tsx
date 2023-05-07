import React, { useState } from "react";
import { useAddFormStore } from "../../../store/product_type/addForm";
import { useRefreshContext } from "../../../context";
import { createNewProductType } from "../../../services/product_types";
import Modal from "../../../components/Modal";
import ProductTypeNameInput from "./ProductTypeName";

interface Props {
  handleClose: () => void;
}

function Form({ handleClose }: Props) {
  const { data, isAllValid: _isAllValid, getAll } = useAddFormStore();
  const isAllValid = _isAllValid();

  const [loading, setLoading] = useState(false);

  const refreshContext = useRefreshContext();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!data) return;

    console.log(getAll());
    setLoading(true);
    createNewProductType(getAll())
      .then(() => {
        handleClose();
        refreshContext.handleRefresh();
      })
      .finally(() => {
        setLoading(false);
      });
  };

  return (
    <Modal>
      <p className="text-indigo-700 text-xl uppercase font-extrabold mb-5 text-center my-3">
        Add new product type
      </p>

      <form onSubmit={handleSubmit} autoComplete="off">
        <div className="space-y-12 mb-10">
          <div className="border-b border-gray-900/10 pb-12">
            <h2 className="text-base font-semibold leading-7 text-gray-900">
              Type of product
            </h2>
            <p className="mt-1 text-sm leading-6 text-gray-600">
              Describe what the type of product is. <br /> For example: pants,
              shorts, shoes...
            </p>

            <div className="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
              <ProductTypeNameInput />
            </div>
          </div>
        </div>

        <div className="absolute bottom-0 left-0 right-0 bg-white border-t-2 border-t-gray-100 px-5 py-3 mt-6 flex items-center justify-end gap-x-6">
          <button
            type="button"
            disabled={loading}
            onClick={handleClose}
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
