import React, { useState, useEffect } from "react";

import { useEditFormStore } from "../../../store/product/editForm";
import { IProductType } from "../../../types";
import { getProductTypes } from "../../../services/misc";

function ProductTypeInput() {
  const editFormStore = useEditFormStore();

  const [value, setValue] = useState<string>(() => {
    return editFormStore.data === null ? "" : editFormStore.data.type_id.value;
  });
  const [types, setTypes] = useState<IProductType[]>([]);

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    editFormStore.updateData({
      type: {
        value:
          types.find((type) => type.type_id === e.target.value)?.type_name ||
          "",
        isValid: true,
      },
      type_id: {
        value: e.target.value,
        isValid: true,
      },
    });
  };

  useEffect(() => {
    const controller = new AbortController();

    if (types.length === 0) {
      getProductTypes({ signal: controller.signal }).then(
        (data: IProductType[] | undefined) => {
          if (!data) return;

          setTypes(data);

          if (!editFormStore.data?.type_id.value) {
            editFormStore.updateData({
              type: {
                value: data[0].type_name,
                isValid: true,
              },
              type_id: {
                value: data[0].type_id,
                isValid: true,
              },
            });
          }
        }
      );
    }

    return () => {
      controller.abort();
    };
  }, [editFormStore, types.length]);

  return (
    <div className="sm:col-span-3">
      <label
        htmlFor="type"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Product type
      </label>
      <div className="mt-2 w-full">
        <select
          value={value}
          onChange={handleChange}
          id="type"
          name="type"
          autoComplete="type-name"
          className="capitalize px-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
        >
          {types.map((type, i) => {
            return (
              <option key={i} value={type.type_id}>
                {type.type_name}
              </option>
            );
          })}
        </select>
      </div>
    </div>
  );
}

export default ProductTypeInput;
