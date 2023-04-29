import React from "react";
import { TopProduct } from "./types";
import { numberWithCommas } from "../../helpers";
import { ArrowUp } from "../../Icons";

interface Props {
  topProducts: TopProduct[];
}

function TopProductsTable({ topProducts }: Props) {
  return (
    <div className="col-span-12 relative overflow-x-auto border border-gray-300 shadow-md  pt-7 pb-5 sm:px-7 sm:rounded-md xl:col-span-10">
      <h3 className="font-semibold uppercase mb-5">Top products</h3>
      <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" className="px-6 py-3">
              Product Name
            </th>
            <th scope="col" className="px-6 py-3">
              Price
            </th>
            <th scope="col" className="px-6 py-3 flex items-center gap-1">
              Sold <ArrowUp />
            </th>
            <th scope="col" className="px-6 py-3">
              Sales
            </th>
          </tr>
        </thead>
        <tbody>
          {topProducts.map(
            ({ price, product_id, product_name, sales, sold }) => (
              <tr
                key={product_id}
                className="font-medium bg-white border-b dark:bg-gray-800 dark:border-gray-700"
              >
                <th
                  scope="row"
                  className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
                >
                  {product_name}
                </th>
                <td className="px-6 py-4">
                  {numberWithCommas(price)}{" "}
                  <small className="text-xs">VND</small>
                </td>
                <td className="px-6 py-4">{numberWithCommas(sold)}</td>
                <td className="px-6 py-4">
                  {numberWithCommas(sales)}{" "}
                  <small className="text-xs">VND</small>
                </td>
              </tr>
            )
          )}
        </tbody>
      </table>
    </div>
  );
}

export default TopProductsTable;
