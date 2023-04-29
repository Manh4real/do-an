import React from "react";

import { IInputProps } from "../_types";

function PriceInput({
  additionalClasses,
  errorMessage,
  handleChange,
  value,
}: IInputProps) {
  return (
    <div className="sm:col-span-4 relative">
      <label
        htmlFor="price"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Price (VND)
      </label>
      <div className="mt-2 flex items-center">
        <span
          id="currency"
          className="p-2 text-xs text-gray-600 font-bold mr-1.5 bg-gray-50 w-9 h-9 rounded shadow-sm shadow-gray-300 ring-gray-200 flex items-center justify-center"
        >
          VND
        </span>
        <input
          value={value}
          onChange={handleChange}
          type="number"
          name="price"
          id="price"
          autoComplete="given-price"
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

export default PriceInput;
