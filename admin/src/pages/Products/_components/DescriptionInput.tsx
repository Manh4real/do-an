import React from "react";

import { IInputProps } from "../_types";

function DescriptionInput({
  additionalClasses,
  errorMessage,
  handleChange,
  value,
}: IInputProps<HTMLTextAreaElement>) {
  return (
    <div className="col-span-full relative">
      <label
        htmlFor="description"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Description
      </label>
      <div className="mt-2">
        <textarea
          value={value}
          onChange={handleChange}
          id="description"
          name="description"
          rows={3}
          className={
            additionalClasses +
            " block w-full rounded-md border-0 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:py-1.5 sm:text-sm sm:leading-6"
          }
        ></textarea>
      </div>
      {errorMessage && (
        <p className="absolute text-sm text-red-600 font-medium">
          {errorMessage}
        </p>
      )}
      <p className="mt-3 text-sm leading-6 text-gray-600">
        Write a few sentences about the product.
      </p>
    </div>
  );
}

export default DescriptionInput;
