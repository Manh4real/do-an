import React from "react";
import countryList from "countries-list";

import { IInputProps } from "../_types";

interface Props extends IInputProps<HTMLSelectElement> {}

function CountryInput({ handleChange, value }: Props) {
  return (
    <div className="sm:col-span-3">
      <label
        htmlFor="country"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Country
      </label>
      <div className="mt-2">
        <select
          value={value}
          onChange={handleChange}
          id="country"
          name="country"
          autoComplete="country-name"
          className="px-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6"
        >
          {Object.entries(countryList.countries).map(([code, info], i) => {
            return (
              <option key={i} value={code}>
                {info.native}
              </option>
            );
          })}
        </select>
      </div>
    </div>
  );
}

export default CountryInput;
