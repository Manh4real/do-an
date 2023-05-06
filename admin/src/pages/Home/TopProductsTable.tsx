import React from "react";
import { TopProduct } from "./types";
import { numberWithCommas } from "../../helpers";
import { ArrowUp } from "../../Icons";
import { useFetchImage } from "../../hooks";

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
          {topProducts.map((product, i) => (
            <TopProductsRow key={i} product={product} />
          ))}
        </tbody>
      </table>
    </div>
  );
}

interface TopProductsRowProps {
  product: TopProduct;
}
const TopProductsRow = ({
  product: { price, product_id, product_name, sales, sold, images },
}: TopProductsRowProps) => {
  const imageName = images[Object.keys(images)[0]]?.[0].url;
  const { imageUrl } = useFetchImage(imageName);

  return (
    <tr className="font-medium bg-white border-b dark:bg-gray-800 dark:border-gray-700">
      <th
        scope="row"
        className="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
      >
        <div className="flex gap-3">
          {imageUrl ? (
            <img
              className="object-cover w-10 h-10 rounded-lg shadow-md"
              src={imageUrl}
              alt=""
            />
          ) : (
            <div className="object-cover w-10 h-10 rounded-lg bg-gray-50 ring-1 ring-gray-400"></div>
          )}
          {product_name}
        </div>
      </th>
      <td className="px-6 py-4">
        {numberWithCommas(price)} <small className="text-xs">VND</small>
      </td>
      <td className="px-6 py-4">{numberWithCommas(sold)}</td>
      <td className="px-6 py-4">
        {numberWithCommas(sales)} <small className="text-xs">VND</small>
      </td>
    </tr>
  );
};

export default TopProductsTable;
