import React from "react";

import { IStatisticFieldProps } from "./types";
import { nFormatter } from "../../helpers";

interface Props {
  users: IStatisticFieldProps;
}
const CardUsers = ({ users }: Props) => {
  const growthRate =
    +users.last_week === 0
      ? +users.this_week
      : ((+users.this_week - +users.last_week) / +users.last_week) * 100;

  const styleClasses = growthRate >= 0 ? "text-green-400" : "text-red-400";

  return (
    <div className="whitespace-nowrap rounded-sm border bg-white py-6 px-7 shadow-lg shadow-gray-100 xl:col-span-3">
      <div className="flex h-11 w-11 items-center justify-center rounded-full bg-indigo-100">
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          strokeWidth={1.5}
          stroke="currentColor"
          className="w-6 h-6 text-indigo-500"
        >
          <path
            strokeLinecap="round"
            strokeLinejoin="round"
            d="M18 18.72a9.094 9.094 0 003.741-.479 3 3 0 00-4.682-2.72m.94 3.198l.001.031c0 .225-.012.447-.037.666A11.944 11.944 0 0112 21c-2.17 0-4.207-.576-5.963-1.584A6.062 6.062 0 016 18.719m12 0a5.971 5.971 0 00-.941-3.197m0 0A5.995 5.995 0 0012 12.75a5.995 5.995 0 00-5.058 2.772m0 0a3 3 0 00-4.681 2.72 8.986 8.986 0 003.74.477m.94-3.197a5.971 5.971 0 00-.94 3.197M15 6.75a3 3 0 11-6 0 3 3 0 016 0zm6 3a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0zm-13.5 0a2.25 2.25 0 11-4.5 0 2.25 2.25 0 014.5 0z"
          />
        </svg>
      </div>

      <div className="mt-4 flex items-end justify-between">
        <div>
          <h4 className="text-3xl font-bold text-black dark:text-white">
            {nFormatter(users.total, 2)}
          </h4>
          <span className="text-sm font-medium">Total customers</span>
        </div>

        <span className={styleClasses + " text-right text-sm font-medium"}>
          {growthRate.toFixed(2)}
          {+users.last_week !== 0 && "%"}
          <span className="flex items-center justify-end gap-1 ml-auto">
            <svg
              // className="fill-green-400"
              width="10"
              height="11"
              viewBox="0 0 10 11"
              fill="currentColor"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="M4.35716 2.47737L0.908974 5.82987L5.0443e-07 4.94612L5 0.0848689L10 4.94612L9.09103 5.82987L5.64284 2.47737L5.64284 10.0849L4.35716 10.0849L4.35716 2.47737Z"
                fill=""
              />
            </svg>
            <small className="text-black text-inherit">this week</small>
          </span>
        </span>
      </div>
    </div>
  );
};

export default CardUsers;
