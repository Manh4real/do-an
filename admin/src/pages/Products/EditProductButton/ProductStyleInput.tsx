import React, { useState, useEffect } from "react";

import { useEditFormStore } from "../../../store/product/editForm";
import { IProductStyle } from "../../../types";
import { getProductStyles } from "../../../services/misc";

function ProductStyleInput() {
  const editFormStore = useEditFormStore();

  const [value, setValue] = useState<string>(() => {
    return editFormStore.data === null
      ? "male"
      : editFormStore.data.style_id.value;
  });
  const [styles, setStyles] = useState<IProductStyle[]>([]);

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    editFormStore.updateData({
      style_id: {
        value: e.target.value,
        isValid: true,
      },
    });
  };

  useEffect(() => {
    const controller = new AbortController();

    if (styles.length === 0) {
      getProductStyles({ signal: controller.signal }).then(
        (data: IProductStyle[] | undefined) => {
          if (!data) return;

          setStyles(data);

          if (!editFormStore.data?.type_id.value) {
            editFormStore.updateData({
              style_id: {
                value: data[0].style_id,
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
  }, [editFormStore, styles.length]);

  return (
    <div className="sm:col-span-2">
      <label
        htmlFor="style"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Product style
      </label>
      <div className="mt-2">
        <select
          value={value}
          onChange={handleChange}
          id="style"
          name="style"
          autoComplete="style-name"
          className="px-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6"
        >
          {styles.map((style, i) => {
            return (
              <option key={i} value={style.style_id}>
                {style.style_name}
              </option>
            );
          })}
        </select>
      </div>
    </div>
  );
}

export default ProductStyleInput;
