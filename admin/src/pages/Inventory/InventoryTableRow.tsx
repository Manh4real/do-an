import React, { useEffect, useState } from "react";
import { IInventoryProduct } from "../../types";
import { formatCurrency } from "../../helpers";
import moment from "moment";
import { ChevronArrowDown, ChevronArrowRight } from "../../Icons";
import SubTableInventoryRow from "./SubTableInventoryRow";
import { getDownloadImage } from "../../features/firebase";

interface Props {
  product: IInventoryProduct;
}

function InventoryTableRow({ product }: Props) {
  const [expand, setExpand] = useState(false);
  const [imageUrl, setImageUrl] = useState("");

  // first image with first color
  const firstImageName =
    product.images[Object.keys(product.images)[0]]?.[0].url ||
    "default-product-image.png";

  useEffect(() => {
    let ignore = false;
    getDownloadImage(firstImageName).then((url) => {
      if (!ignore) {
        url && setImageUrl(url);
      }
    });

    return () => {
      ignore = true;
    };
  }, [firstImageName]);

  return (
    <>
      <tr
        onClick={() => {
          setExpand((prev) => !prev);
        }}
        onKeyUp={(e) => {
          e.preventDefault();

          if (e.key === "Enter" || e.key === " ") {
            setExpand((prev) => !prev);
          }
        }}
        role="button"
        tabIndex={0}
        className="cursor-pointer hover:bg-gray-50"
      >
        <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
          {product.product_id}
        </td>
        <td className="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
          <div className="inline-flex items-center gap-x-3">
            <div className="flex items-center gap-x-2">
              {imageUrl ? (
                <img
                  className="object-cover w-10 h-10 rounded-full"
                  src={imageUrl}
                  alt=""
                />
              ) : (
                <div className="object-cover w-10 h-10 rounded-full bg-gray-50 ring-1 ring-gray-400"></div>
              )}

              <div>
                <h2 className="max-w-[150px] text-ellipsis overflow-hidden whitespace-nowrap font-medium text-gray-800">
                  {product.product_name}
                </h2>
              </div>
            </div>
          </div>
        </td>
        <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
          <span className="capitalize">{product.type_name}</span>
        </td>
        <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
          <span className="capitalize">{product.gender}</span>
        </td>
        <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
          {moment(new Date(product.created_at)).format("ll")}
        </td>
        <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
          {formatCurrency(product.price)}
          <span className="text-xs font-medium mx-1">VND</span>
        </td>
        <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
          <span className="capitalize">
            {Object.entries(product.colors)
              .map(([, color]) => color.color_name)
              .join(" / ")}
          </span>
        </td>
        <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
          <div className="flex flex-wrap gap-2 max-w-[180px]">
            {Object.entries(product.colors).map(([color_id, color]) => {
              return color.sizes.map((stock) => (
                <div
                  key={color_id + stock.size_id}
                  className="p-1 ring-1 ring-gray-300 rounded w-7 h-7 text-xs font-medium flex justify-center items-center"
                >
                  {stock.size}
                </div>
              ));
            })}
          </div>
        </td>
        <td className="px-4 py-4 text-lg text-gray-500 whitespace-nowrap">
          <span className="block text-center">
            {Object.entries(product.colors).reduce(
              (acc, [, color]) =>
                acc +
                color.sizes.reduce((acc2, { quantity }) => acc2 + quantity, 0),
              0
            )}
          </span>
        </td>
        <td className="px-4 py-4 text-lg text-gray-500 whitespace-nowrap">
          {expand ? <ChevronArrowRight /> : <ChevronArrowDown />}
        </td>
      </tr>
      {expand && (
        <tr>
          <td
            colSpan={10}
            className="px-4 py-4 text-lg text-gray-500 whitespace-nowrap"
          >
            <table className="ml-auto w-[60%]">
              <thead>
                <tr>
                  <th className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
                    Color
                  </th>
                  <th className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
                    Sizes
                  </th>
                  <th className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
                    Stock (Available Quantity)
                  </th>
                  <th className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"></th>
                </tr>
              </thead>

              <tbody>
                {Object.entries(product.colors).map(([color_id, color]) => (
                  <SubTableInventoryRow key={color_id} color={color} />
                ))}
              </tbody>
            </table>
          </td>
        </tr>
      )}
    </>
  );
}

export default InventoryTableRow;
