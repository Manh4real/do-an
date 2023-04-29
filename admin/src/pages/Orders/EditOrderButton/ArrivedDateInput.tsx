import React from "react";
import { isInThePast } from "../../../helpers";
import moment from "moment";

interface Props {
  arrivedDate: {
    value: string;
    isValid: boolean;
  };
  handleChangeArrivedDate: (arrivedDate: string, isValid: boolean) => void;
}

function ArrivedDateInput({ arrivedDate, handleChangeArrivedDate }: Props) {
  return (
    <div className="relative mt-4">
      <label
        htmlFor="date"
        className="block text-sm font-medium leading-6 text-gray-900"
      >
        Estimated Arrived Date
      </label>
      <div className="mt-2">
        <input
          id="date"
          type="date"
          // value={arrivedDate.value.slice(0, 10)}
          value={moment(arrivedDate.value).format("YYYY-MM-DD")}
          onChange={(e) => {
            console.log(e.target.value);
            if (isInThePast(new Date(e.target.value))) {
              handleChangeArrivedDate(e.target.value, false);
            } else {
              handleChangeArrivedDate(e.target.value, true);
            }
          }}
          className={
            "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-indigo-800 focus:border-indigo-800 block w-full dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-indigo-800 dark:focus:border-indigo-800"
          }
          placeholder="Select date"
        />

        {!arrivedDate.isValid && (
          <p className="text-red-600 font-medium text-sm mt-1 absolute">
            Arrived date can't be in the past.
          </p>
        )}
      </div>
    </div>
  );
}

export default ArrivedDateInput;
