import React, { useState, useEffect } from "react";

import { useEditFormStore as useProductEditFormStore } from "../../../store/product/editForm";

import { IProduct } from "../../../types";
import { updateProduct } from "../../../services/products";

import Modal from "../../../components/Modal";

import ManufacturerInput from "./ManufacturerInput";
import ProductTypeInput from "./ProductTypeInput";
import CategoryInput from "./CategoryInput";
import GenderInput from "./GenderInput";
import TargetInput from "./TargetInput";
import ProductStyleInput from "./ProductStyleInput";
import PriceInput from "./PriceInput";
import ColorInput from "./ColorInput";
import DescriptionInput from "./DescriptionInput";
import ProductNameInput from "./ProductNameInput";

import { useRefreshContext } from "../../../context";

interface Props {
  product: IProduct;
  handleClose: () => void;
}

function Form({ product, handleClose }: Props) {
  const {
    data,
    isAllValid: _isAllValid,
    getAll,
    // updateData,
    init,
    reset,
  } = useProductEditFormStore();

  const isAllValid = _isAllValid();
  const [loading, setLoading] = useState(false);

  const refreshContext = useRefreshContext();

  console.log(data);

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
      updateProduct(product.product_id, body)
        .then(() => {
          reset();
          handleClose();
          refreshContext.handleRefresh();
        })
        .catch((err) => {
          console.log(err);
        })
        .finally(() => {
          setLoading(false);
        });
    }
  };

  useEffect(() => {
    init({
      ...product,
      colors: [...Object.keys(product.stock)],
      addedImages: {},
      removedImages: {},
      removedColors: [],
      stock: product.stock,
      changedStock: Object.fromEntries(
        Object.entries(product.stock).map(([colorId, stock]) => {
          return [
            colorId,
            stock.map((s) => ({
              color_id: s.color_id,
              quantity: s.quantity,
              size_id: s.size_id,
            })),
          ];
        })
      ),
    });
  }, [product, init]);

  // useEffect(() => {
  //   if (!data?.stock?.value)
  //     getStockByProductId(product.product_id).then((data) => {
  //       if (Object.keys(data).length > 0) {
  //         updateData({
  //           stock: {
  //             value: data,
  //             isValid: true,
  //           },
  //         });
  //       }
  //     });
  // }, [data, product.product_id, updateData]);

  if (!data) return <></>;

  return (
    <Modal large={true}>
      <p className="text-indigo-700 text-xl uppercase font-extrabold mb-5 text-center my-3">
        Edit Product
      </p>

      <form onSubmit={handleSubmit}>
        <div className="space-y-12 mb-10">
          <div className="border-b border-gray-900/10 pb-12">
            <h2 className="text-base font-semibold leading-7 text-gray-900">
              Personal Information
            </h2>
            <p className="mt-1 text-sm leading-6 text-gray-600">
              Use a permanent address where you can receive mail.
            </p>

            <div className="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
              <ProductNameInput />
              <ManufacturerInput />
              <ProductTypeInput />
              {/* <CategoryInput /> */}
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
