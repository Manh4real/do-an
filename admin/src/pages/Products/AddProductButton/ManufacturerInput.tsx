import React, { useEffect, useState } from "react";

import { useAddFormStore } from "../../../store/product/addForm";
import { IManufacturer } from "../../../types";
import { getManufacturers } from "../../../services/misc";

function ManufacturerInput() {
  const addFormStore = useAddFormStore();

  const [value, setValue] = useState<string>(() => {
    // const data = addFormStore.data;

    // return data === null ? "" : data.role.value;
    return "";
  });
  const [manufacturers, setManufacturers] = useState<IManufacturer[]>([]);

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    addFormStore.updateData({
      manufacturer_id: {
        value: e.target.value,
        isValid: true,
      },
    });
  };

  useEffect(() => {
    const controller = new AbortController();

    if (manufacturers.length === 0) {
      getManufacturers({ signal: controller.signal }).then(
        (data: IManufacturer[] | undefined) => {
          if (!data) return;

          setManufacturers(data);

          if (!addFormStore.data.manufacturer_id.value) {
            addFormStore.updateData({
              manufacturer_id: {
                value: data[0].manufacturer_id,
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
  }, [addFormStore, manufacturers.length]);

  return (
    <div className="sm:col-span-4">
      <label
        htmlFor="role"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Manufacturer
      </label>
      <div className="mt-2">
        <select
          value={value}
          onChange={handleChange}
          id="role"
          name="role"
          autoComplete="role-name"
          className="px-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6"
        >
          {manufacturers.map((manufacturer, i) => {
            return (
              <option key={i} value={manufacturer.manufacturer_id}>
                {manufacturer.brand_name}
              </option>
            );
          })}
        </select>
      </div>
    </div>
  );
}

export default ManufacturerInput;
