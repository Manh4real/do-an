import React from "react";

import { IInputProps } from "../_types";
import { ISize } from "../../../types";

interface Props extends IInputProps {
  size: ISize;
  colorName: string;
}
function QuantityInput({
  additionalClasses,
  errorMessage,
  handleChange,
  value,
  size,
  colorName,
}: Props) {
  return (
    <div className="sm:col-span-2 relative mt-2 mr-5 max-w-xs inline-block">
      <label
        htmlFor="quantity"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Quantity of {colorName} / size {size.size}
      </label>
      <div className="mt-2">
        <input
          value={value}
          onChange={handleChange}
          type="number"
          name="quantity"
          id="quantity"
          min={0}
          autoComplete="given-quantity"
          className={
            additionalClasses +
            " pl-3 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
          }
        />
      </div>
      {errorMessage && (
        <p className="absolute text-xs text-red-600 font-medium">
          {errorMessage}
        </p>
      )}
    </div>
  );
}

export default QuantityInput;
