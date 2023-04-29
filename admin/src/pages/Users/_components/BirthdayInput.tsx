import React from "react";

import { IInputProps } from "../_types";

interface Props extends IInputProps {}

function BirthdayInput({
  additionalClasses,
  errorMessage,
  handleChange,
  value,
}: Props) {
  return (
    <div className="sm:col-span-4 relative">
      <label
        htmlFor="birthday"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Birthday
      </label>
      <div className="mt-2">
        <input
          id="birthday"
          type="date"
          value={value}
          onChange={handleChange}
          className={
            additionalClasses +
            " bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-indigo-800 focus:border-indigo-800 block w-full dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-indigo-800 dark:focus:border-indigo-800"
          }
          placeholder="Select date"
        />
      </div>
      {errorMessage && (
        <p className="absolute text-xs mt-1 text-red-600 font-medium">
          {errorMessage}
        </p>
      )}
    </div>
  );
}

export default BirthdayInput;
