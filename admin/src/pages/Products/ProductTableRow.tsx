import React, { useMemo } from "react";

import { IProduct } from "../../types";
import DeleteButton from "./DeleteButton";
import EditUserButton from "./EditProductButton";
import { formatCurrency } from "../../helpers";
import moment from "moment";
import { useFetchImage } from "../../hooks";

interface Props {
  nth: number;
  product: IProduct;
}

interface IDisplayedSize {
  size: string;
  size_id: string;
}

function ProductTableRow({ nth, product }: Props) {
  // first image with first color
  const firstImageName =
    product.images[Object.keys(product.images)[0]]?.[0].url ||
    "default-product-image.png";

  const { imageUrl } = useFetchImage(firstImageName);

  const _product = {
    ...product,
    // imageUrl: imageUrl || product.imageUrl,
    image: imageUrl,
  };

  // displayed sizes
  const displayedSizes = useMemo(() => {
    const sizes: IDisplayedSize[] = [];
    Object.entries(product.stock).forEach(([, color]) => {
      color.forEach((stock) => {
        if (sizes.findIndex(({ size_id }) => stock.size_id === size_id) !== -1)
          return;

        sizes.push({ size: stock.size, size_id: stock.size_id });
      });
    });
    const displayedSizes = sizes.sort((a, b) => +a.size_id - +b.size_id);

    return displayedSizes;
  }, [product.stock]);

  return (
    <tr>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        {nth}
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
              {/* <p className="text-sm font-normal text-gray-600">@authurmelo</p> */}
            </div>
          </div>
        </div>
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {product.gender[0].toUpperCase() + product.gender.slice(1)}
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {product.target}
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {formatCurrency(product.price)}{" "}
        <span className="text-xs font-medium mx-1">VND</span>
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        <div className="flex flex-wrap gap-2 max-w-[180px]">
          {displayedSizes.map(({ size }, i) => {
            return (
              <div
                key={i}
                className="p-1 ring-1 ring-gray-300 rounded w-7 h-7 text-xs font-medium flex justify-center items-center"
              >
                {size}
              </div>
            );
          })}
          {/* {displayedSizes.length > 9 && (
            <span
              title="See more"
              className="font-medium ml-1 hover:bg-gray-200 flex items-center cursor-pointer"
            >
              ...
            </span>
          )} */}
        </div>
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {/* {new Date(product.created_at).toUTCString().slice(4, 17)} */}
        {moment(new Date(product.created_at)).format("ll")}
      </td>
      <td className="max-w-[200px] text-ellipsis overflow-hidden whitespace-nowrap px-4 py-4 text-sm text-gray-500">
        {product.description}
      </td>
      <td className="px-4 py-4 text-sm whitespace-nowrap">
        <div className="flex items-center gap-x-6">
          <DeleteButton productId={product.product_id} />
          <EditUserButton product={_product} />
        </div>
      </td>
    </tr>
  );
}

export default ProductTableRow;
