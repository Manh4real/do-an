import React, { useState, useEffect } from "react";
import { IProductType } from "../../../types";

import ProductTypeNameInput from "./ProductTypeName";
import { useEditFormStore } from "../../../store/product_type/editForm";
import { useRefreshContext } from "../../../context";
import { updateProductType } from "../../../services/product_types";
import Modal from "../../../components/Modal";

interface Props {
  type: IProductType;
  handleClose: () => void;
}

function Form({ type, handleClose }: Props) {
  const { data, isAllValid: _isAllValid, getAll } = useEditFormStore();
  const isAllValid = _isAllValid();

  const { init, reset } = useEditFormStore();

  const [loading, setLoading] = useState(false);

  const refreshContext = useRefreshContext();

  const handleCancel = () => {
    handleClose();
    reset();
  };
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!data) return;

    console.log(getAll());
    const body = getAll();

    if (body) {
      setLoading(true);
      updateProductType(type.type_id, body)
        .then(() => {
          handleClose();
          refreshContext.handleRefresh();
        })
        .finally(() => {
          setLoading(false);
        });
    }
  };

  useEffect(() => {
    init(type);
  }, [type, init]);

  if (!data) return <></>;

  return (
    <Modal>
      <p className="text-indigo-700 text-xl uppercase font-extrabold mb-5 text-center my-3">
        Edit product type
      </p>

      <form onSubmit={handleSubmit}>
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
            onClick={handleCancel}
            className="text-sm font-semibold leading-6 text-gray-900"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={!isAllValid || loading}
            className=" disabled:bg-indigo-300 w-32 rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          >
            {loading ? "Processing..." : "Save changes"}
          </button>
        </div>
      </form>
    </Modal>
  );
}

export default Form;
