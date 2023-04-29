import React from "react";

import { IInputProps } from "../_types";

interface Props extends IInputProps<HTMLSelectElement> {}

function RoleInput({ handleChange, value }: Props) {
  return (
    <div className="sm:col-span-3">
      <label
        htmlFor="role"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Role
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
          <option value={0}>Admin</option>
          <option value={1}>Customer</option>
          <option value={2}>Inventory Manager</option>
        </select>
      </div>
    </div>
  );
}

export default RoleInput;
