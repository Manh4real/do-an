import React, { useState, useEffect } from "react";

import "../_components/SizesInput.css";
import { useAddFormStore } from "../../../store/product/addForm";
import { getSizes } from "../../../services/misc";
import { ISize } from "../../../types";
import Quantity from "./QuantityInput";
// import { IClothesSizes, IShoesSizes } from "../../../types";

type IProductType = string;
// type ISizes = IClothesSizes[] | IShoesSizes[];

type ISizes = ISize[];
type FetchSize = {
  [key: string]: {
    size_id: string;
    size_type_id: string;
    size_type_name: string;
    size: string;
  }[];
};

interface Props {
  colorId: string;
  colorName: string;
}
function SizesInput({ colorId, colorName }: Props) {
  const addFormStore = useAddFormStore();

  const [productType, setProductType] = useState<IProductType>();
  const [selectedSizes, setSelectedSizes] = useState<ISizes>([]);
  const [sizes, setSizes] = useState<FetchSize>({});

  const handleChangeProductType = (type: IProductType) => {
    setProductType(type);
    setSelectedSizes([]);

    addFormStore.updateData({
      size_type_id: {
        value: type,
        isValid: true,
      },
    });
  };
  const handleChangeSizes = (
    e: React.ChangeEvent<HTMLInputElement>,
    size: ISize
  ) => {
    let changed = [...selectedSizes];

    if (e.target.checked) {
      changed = [...selectedSizes, size];
    } else {
      changed = selectedSizes.filter((s) => s.size_id !== size.size_id);
    }

    console.log(changed);

    setSelectedSizes(changed);
    addFormStore.updateData({
      sizes: {
        value: changed.map((s) => s.size),
        isValid: changed.length > 0,
      },
      stock: {
        value: {
          ...addFormStore.data.stock.value,
          [colorId]: changed.map((s) => ({
            color_id: colorId,
            size_id: s.size_id,
            quantity: 1,
          })),
        },
        isValid: true,
      },
    });
  };

  useEffect(() => {
    getSizes().then((data) => {
      setSizes(data);
      setProductType(Object.keys(data)[0]);
    });
  }, []);

  let displayedSizes: ISizes = productType ? sizes[productType] : [];

  const activeClass =
    "text-white bg-indigo-700 border border-indigo-200 focus:z-10 focus:ring-2 focus:ring-blue-700 dark:bg-indigo-700 dark:border-indigo-600 focus:text-white dark:hover:text-white dark:hover:bg-indigo-700 hover:bg-indigo-700";
  const normalClass =
    "text-gray-900 bg-white border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-2 focus:ring-blue-700 focus:text-blue-700 dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-blue-500 dark:focus:text-white";

  return (
    <div className="sm:col-span-6 relative mb-16 mt-2">
      <div className="block text-sm font-medium leading-6 text-gray-900">
        Sizes of {colorName} color
      </div>
      <div
        className="mt-2 w-full inline-flex rounded-md shadow-sm"
        role="group"
      >
        {Object.entries(sizes).map(([size_type_id, sizes]) => {
          const { size_type_name } = sizes[0];

          return (
            <button
              key={size_type_id}
              type="button"
              className={
                (productType === size_type_id ? activeClass : normalClass) +
                " capitalize outline-transparent flex-1 px-4 py-2 text-sm font-medium"
              }
              onClick={() => {
                handleChangeProductType(size_type_id);
              }}
            >
              {size_type_name}
            </button>
          );
        })}
      </div>
      <div className="mt-6 flex items-center justify-center flex-wrap gap-3">
        {displayedSizes.map((size) => {
          return (
            <div
              key={size.size_id}
              className="relative flex w-1/12 gap-x-3 items-center"
            >
              <input
                id={"size-" + colorId + size.size_id}
                name="size"
                type="checkbox"
                value={size.size_id}
                checked={selectedSizes.some((s) => s.size_id === size.size_id)}
                onChange={(e) => {
                  handleChangeSizes(e, size);
                }}
                className="h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600"
              />
              <label
                htmlFor={"size-" + colorId + size.size_id}
                className="text-sm ring-1 ring-gray-200 rounded w-full h-10 items-center flex justify-center cursor-pointer font-medium text-gray-900 hover:bg-gray-100 focus-visible:outline-indigo-800"
              >
                {size.size}
              </label>
            </div>
          );
        })}
      </div>

      {selectedSizes.map((size) => {
        return (
          <Quantity
            key={size.size_id}
            size={size}
            colorId={colorId}
            colorName={colorName}
          />
        );
      })}
    </div>
  );
}

// const CLOTHES_SIZES = ["XS", "S", "M", "L", "XL", "2XL", "3XL", "4XL"];
// const SHOES_SIZES = [
//   "4",
//   "4.5",
//   "5",
//   "5.5",
//   "6",
//   "6.5",
//   "7",
//   "7.5",
//   "8",
//   "8.5",
//   "9",
//   "9.5",
//   "10",
//   "10.5",
//   "11",
//   "11.5",
//   "12",
//   "12.5",
//   "13",
//   "13.5",
//   "14",
//   "14.5",
//   "15",
//   "15.5",
// ];

export default SizesInput;
