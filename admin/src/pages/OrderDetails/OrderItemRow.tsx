import React, { useEffect, useState } from "react";
import { IOrder, IOrderItem } from "../../types";
import { getDownloadImage } from "../../features/firebase";
import { formatCurrency } from "../../helpers";

interface Props {
  item: IOrder & IOrderItem;
  nth: number;
}

function OrderItemRow({ item, nth }: Props) {
  const [imageUrl, setImageUrl] = useState("");

  const imageName = item.product.images[item.color_id][0].url;

  useEffect(() => {
    getDownloadImage(imageName).then((url) => {
      setImageUrl(url);
    });
  }, [imageName]);

  return (
    <tr className="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
      <td className="px-6 py-4 font-semibold text-gray-900 dark:text-white">
        {nth}
      </td>
      <td className="w-24 p-4">
        <img src={imageUrl || imageName} alt="Apple Watch" />
      </td>
      <td className="px-6 py-4 font-semibold text-gray-900 dark:text-white">
        {item.product.product_name}
      </td>
      <td className="px-6 py-4">
        <div className="flex items-center font-medium space-x-3">
          {item.quantity}
        </div>
      </td>
      <td className="px-6 py-4 font-semibold text-gray-900 dark:text-white">
        {formatCurrency(item.product.price)}
        <span className="text-sm mx-1">VND</span>
      </td>
      <td className="px-6 py-4 font-semibold text-gray-900 dark:text-white">
        <span className="px-2 py-1 flex items-center justify-center w-8 h-8 ring-1 ring-gray-600">
          {item.size}
        </span>
      </td>
      <td className="px-6 py-4 font-semibold text-gray-900 capitalize dark:text-white">
        {item.color_name}
      </td>
      {/* <td className="px-6 py-4 font-semibold capitalize text-gray-900 dark:text-white">
        {item.status}
      </td> */}
      <td className="px-6 py-4">
        {/* <a
          href="/"
          className="font-medium text-red-600 dark:text-red-500 hover:underline"
        >
          Remove
        </a> */}
      </td>
    </tr>
  );
}

export default OrderItemRow;
