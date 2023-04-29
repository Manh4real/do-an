import React from "react";
import { IStatisticFieldProps } from "./types";
import { nFormatter } from "../../helpers";

interface Props {
  sales: IStatisticFieldProps;
}

const CardSales = ({ sales }: Props) => {
  const growthRate =
    +sales.last_week === 0
      ? +sales.this_week
      : ((+sales.this_week - +sales.last_week) / +sales.last_week) * 100;

  const styleClasses = growthRate >= 0 ? "text-green-400" : "text-red-400";

  return (
    <div className="whitespace-nowrap rounded-sm border bg-white py-6 px-7 shadow-lg shadow-gray-100">
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
            d="M2.25 18.75a60.07 60.07 0 0115.797 2.101c.727.198 1.453-.342 1.453-1.096V18.75M3.75 4.5v.75A.75.75 0 013 6h-.75m0 0v-.375c0-.621.504-1.125 1.125-1.125H20.25M2.25 6v9m18-10.5v.75c0 .414.336.75.75.75h.75m-1.5-1.5h.375c.621 0 1.125.504 1.125 1.125v9.75c0 .621-.504 1.125-1.125 1.125h-.375m1.5-1.5H21a.75.75 0 00-.75.75v.75m0 0H3.75m0 0h-.375a1.125 1.125 0 01-1.125-1.125V15m1.5 1.5v-.75A.75.75 0 003 15h-.75M15 10.5a3 3 0 11-6 0 3 3 0 016 0zm3 0h.008v.008H18V10.5zm-12 0h.008v.008H6V10.5z"
          />
        </svg>
      </div>

      <div className="mt-4 flex items-end justify-between">
        <div>
          <h4 className="text-3xl font-bold text-black dark:text-white">
            {nFormatter(sales.total, 2)} <small className="text-sm ">VND</small>
          </h4>
          <span className="text-sm font-medium">Total sales</span>
        </div>

        <span
          className={
            styleClasses + " flex items-center gap-1 text-sm font-medium"
          }
        >
          {growthRate.toFixed(2)}
          {+sales.last_week !== 0 && "%"}
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

export default CardSales;
