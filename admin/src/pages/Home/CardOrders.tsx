import React from "react";
import { CartIcon } from "../../Icons";

import { IStatisticFieldProps } from "./types";
import { nFormatter } from "../../helpers";

interface Props {
  items: IStatisticFieldProps;
}
const CardOrders = ({ items }: Props) => {
  const growthRate =
    +items.last_week === 0
      ? +items.this_week
      : ((+items.this_week - +items.last_week) / +items.last_week) * 100;

  const styleClasses = growthRate >= 0 ? "text-green-400" : "text-red-400";

  return (
    <div className="whitespace-nowrap rounded-sm border bg-white py-6 px-7 shadow-lg shadow-gray-100">
      <div className="flex h-11 w-11 items-center justify-center rounded-full bg-indigo-100">
        <CartIcon />
      </div>

      <div className="mt-4 flex items-end justify-between">
        <div>
          <h4 className="text-3xl font-bold text-black dark:text-white">
            {nFormatter(items.total, 2)}
          </h4>
          <span className="text-sm font-medium">Total orders</span>
        </div>

        <span
          className={
            styleClasses + " flex items-center gap-1 text-sm font-medium"
          }
        >
          {growthRate.toFixed(2)}
          {+items.last_week !== 0 && "%"}
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
      </div>
    </div>
  );
};

export default CardOrders;
