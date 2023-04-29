import React, { useEffect, useState } from "react";
import { getDownloadImage } from "../../features/firebase";

import { IProduct } from "../../types";
import DeleteButton from "./DeleteButton";
import EditUserButton from "./EditProductButton";
import { formatCurrency } from "../../helpers";
import moment from "moment";

interface Props {
  nth: number;
  product: IProduct;
}

function ProductTableRow({ nth, product }: Props) {
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

  const _product = {
    ...product,
    // imageUrl: imageUrl || product.imageUrl,
    image: imageUrl,
  };

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
          {Object.entries(product.stock).map(([colorId, s]) => {
            return s.map((st) => {
              return (
                <div
                  key={st.color_id + st.size_id}
                  className="p-1 ring-1 ring-gray-300 rounded w-7 h-7 text-xs font-medium flex justify-center items-center"
                >
                  {st.size}
                </div>
              );
            });
          })}
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
