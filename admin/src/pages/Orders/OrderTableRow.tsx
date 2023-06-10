import React, { useState } from "react";

import { IOrder, IOrderItem } from "../../types";
import { Link } from "react-router-dom";
import EditOrderButton from "./EditOrderButton";
import {
  formatCurrency,
  getPaymentStatusClasses,
  getStatusClasses,
} from "../../helpers";
import DeleteButton from "./DeleteButton";
import moment from "moment";
import { CheckIcon, RadioIcon, XIcon } from "../../Icons";

interface Props {
  order: IOrder;
  orderItems: IOrderItem[];
  nth: number;
}

function OrderTableRow({ order, orderItems, nth }: Props) {
  const statusColorClass = getStatusClasses(order.order_status_name);
  const paymentStatusColorClass = getPaymentStatusClasses(
    order.payment_status_name
  );

  return (
    <tr>
      <td className="px-2 py-4 text-sm text-gray-700 whitespace-nowrap">
        {nth}
      </td>
      <td className="px-2 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
        <div className="inline-flex items-center gap-x-3">
          <div className="flex items-center gap-x-2">
            <div>
              <h2 className="font-medium text-gray-800">{order.order_id}</h2>
            </div>
          </div>
        </div>
      </td>
      <td className="px-2 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
        <div className="inline-flex items-center py-1 rounded-full gap-x-2 ">
          <h2 className="font-medium text-gray-800">{order.customer_name}</h2>
        </div>
      </td>
      <td className="px-2 py-4 text-sm text-gray-500">
        <OrderItemsNames orderItems={orderItems} />
      </td>
      <td className="px-2 py-4 text-sm text-gray-500 capitalize w-max">
        <span className="flex items-center gap-x-1 font-medium capitalize">
          <span
            className={`${paymentStatusColorClass.color}`}
            title={order.payment_status_name}
          >
            {order.payment_status_name === "success" && <CheckIcon />}
            {order.payment_status_name === "failed" && <XIcon />}
            {order.payment_status_name === "initial" && <RadioIcon />}
          </span>
          {order.payment_method_name}
        </span>
      </td>
      <td className="px-2 py-4 text-sm text-gray-500 whitespace-nowrap">
        {/* {new Date(order.est_arrived_date).toLocaleDateString()} */}
        {moment(new Date(order.est_arrived_date)).format("ll")}
      </td>
      <td className="px-2 py-4 text-sm text-gray-500 whitespace-nowrap">
        {/* {new Date(order.created_at).toLocaleDateString()} */}
        {moment(new Date(order.created_at)).format("YYYY-MM-DD")} <br />
        <small className="text-sm">
          {moment(new Date(order.created_at)).format("HH:mm:ss")}
        </small>
      </td>
      <td className="px-2 py-4 text-sm text-gray-500 whitespace-nowrap">
        {formatCurrency(order.total_price)}
        <span className="text-xs font-medium mx-1">VND</span>
      </td>
      <td className={"px-2 py-4 text-sm whitespace-nowrap capitalize"}>
        <span
          className={`${statusColorClass.toString()} font-medium px-3 py-2 rounded-full`}
        >
          {order.order_status_name}
        </span>
      </td>
      <td className="px-2 py-4 text-sm whitespace-nowrap">
        <div className="flex items-center justify-end gap-x-3 w-40 m-auto">
          <DeleteButton orderId={order.order_id} />
          {/* {order.order_status_name !== "done" &&
            order.order_status_name !== "canceled" && (
              <EditOrderButton order={order} />
            )} */}
          <EditOrderButton order={order} />
          <Link
            to={"/orders/details/" + order.order_id}
            className="bg-indigo-700 text-white p-2 rounded font-medium hover:underline hover:underline-offset-2"
          >
            View Details
          </Link>
        </div>
      </td>
    </tr>
  );
}

const OrderItemsNames = ({ orderItems }: { orderItems: IOrderItem[] }) => {
  const [seeMore, setSeeMore] = useState(false);

  const handleToggle = () => {
    setSeeMore((prev) => !prev);
  };

  return (
    <ol className="list-decimal">
      {orderItems
        .map((orderItem, i) => <OrderItemName key={i} orderItem={orderItem} />)
        .slice(0, 3)}
      {seeMore &&
        orderItems
          .map((orderItem, i) => (
            <OrderItemName key={i} orderItem={orderItem} />
          ))
          .slice(3)}
      {orderItems.length > 3 && (
        <div
          onClick={handleToggle}
          className="underline cursor-pointer text-black font-medium mt-2 hover:text-black"
        >
          {seeMore ? "See less" : `+${orderItems.length - 3} more`}
        </div>
      )}
    </ol>
  );
};

const OrderItemName = ({ orderItem }: { orderItem: IOrderItem }) => {
  const {
    quantity,
    color_name,
    size,
    product: { product_name },
  } = orderItem;

  return (
    <li className="mb-1">
      {product_name}{" "}
      <span className="font-medium text-black">&times;{quantity}</span> -{" "}
      <span className="capitalize">{color_name}</span> - {size}
    </li>
  );
};

export default OrderTableRow;
