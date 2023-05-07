import React from "react";
import { IManufacturerInputProps } from "../_types";

interface Props extends IManufacturerInputProps {}

function BrandNameInput({
  additionalClasses,
  errorMessage,
  handleChange,
  value,
}: Props) {
  return (
    <div className="sm:col-span-6 relative">
      <label
        htmlFor="brand-name"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Brand name
      </label>
      <div className="mt-2">
        <input
          value={value}
          onChange={handleChange}
          type="text"
          name="brand-name"
          id="brand-name"
          autoComplete="given-name"
          className={
            additionalClasses +
            " pl-3 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
          }
        />
      </div>
      {errorMessage && (
        <p className="absolute text-sm text-red-600 font-medium">
          {errorMessage}
        </p>
      )}
    </div>
  );
}

export default BrandNameInput;
