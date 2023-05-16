import React, { useEffect, useState } from "react";
import { IOrder, IOrderItem } from "../../types";
import { getOrderById } from "../../services/orders";
import { useParams } from "react-router-dom";
import OrderItemRow from "./OrderItemRow";
import {
  formatCurrency,
  formatPhoneNumber,
  getPaymentStatusClasses,
  getStatusClasses,
} from "../../helpers";
import Spinner from "../../components/Spinner";

type State = (IOrder & IOrderItem)[];
function OrderDetails() {
  const [order, setOrder] = useState<State | null>(null);
  const [loading, setLoading] = useState(false);

  const { orderId } = useParams();

  useEffect(() => {
    if (orderId) {
      setLoading(true);
      getOrderById(orderId)
        .then((data) => {
          // console.log(data);
          setOrder(data);
        })
        .finally(() => {
          setLoading(false);
        });
    }
  }, [orderId]);

  if (!order) return <></>;

  const orderInfo = order[0];

  let statusColorClass = getStatusClasses(orderInfo.order_status_name);
  let paymentStatusColorClass = getPaymentStatusClasses(
    orderInfo.payment_status_name
  );

  if (loading) {
    return (
      <div className="m-auto w-max mt-16">
        <Spinner />
      </div>
    );
  }

  return (
    <div className="container p-8 mb-10">
      <h1 className="mb-4 text-xl font-extrabold leading-none tracking-tight text-gray-900 md:text-3xl lg:text-4xl dark:text-white">
        Order #{orderId} details
      </h1>
      <div
        className={
          statusColorClass.toString() +
          " mb-2 py-2 px-3 w-max rounded-full capitalize font-medium"
        }
      >
        {orderInfo.order_status_name}
      </div>

      <div className="grid grid-cols-6 max-w-4xl">
        <dl className="col-span-3 max-w-xl text-gray-900 divide-y divide-gray-200 dark:text-white dark:divide-gray-700">
          <div className="flex flex-col pb-3">
            <dt className="mb-1 text-gray-500 md:text-lg dark:text-gray-400">
              Customer
            </dt>
            <dd className="text-lg font-semibold">{orderInfo.customer_name}</dd>
          </div>
          <div className="flex flex-col pb-3">
            <dt className="mb-1 text-gray-500 md:text-lg dark:text-gray-400">
              Receiver
            </dt>
            <dd className="text-lg font-semibold">{orderInfo.receiver}</dd>
          </div>
          <div className="flex flex-col py-3">
            <dt className="mb-1 text-gray-500 md:text-lg dark:text-gray-400">
              Delivery address
            </dt>
            <dd className="text-lg font-semibold">{orderInfo.address}</dd>
          </div>
          <div className="flex flex-col pt-3">
            <dt className="mb-1 text-gray-500 md:text-lg dark:text-gray-400">
              Phone number
            </dt>
            <dd className="text-lg font-semibold">
              {orderInfo.phone.slice(0, 3) +
                " " +
                formatPhoneNumber(orderInfo.phone.slice(-10))}
            </dd>
          </div>
          <div className="flex flex-col pt-3">
            <dt className="mb-1 text-gray-500 md:text-lg dark:text-gray-400">
              Estimated arrived date
            </dt>
            <dd className="text-lg font-semibold">
              {new Date(orderInfo.est_arrived_date).toDateString()}
            </dd>
          </div>
        </dl>

        <div className="relative col-span-3 flex flex-col gap-2 text-right">
          <p className="absolute -top-5 right-0 -translate-y-full mb-2">
            <span className="font-medium mr-3">Payment</span>
            <span
              className={
                paymentStatusColorClass.toString() +
                " py-2 px-3 w-max rounded-full capitalize font-medium"
              }
            >
              {orderInfo.payment_status_name}
            </span>
          </p>
          <p className="text-4xl font-extrabold leading-none tracking-tight text-blue-600 dark:text-blue-500">
            Total price: {formatCurrency(orderInfo.total_price)}
            <span className="text-xs font-medium mx-1">VND</span>
          </p>
          <small className="text-gray-500">includes</small>
          <p className="text-lg font-medium text-black dark:text-white">
            Total shipping cost: 30,000
            <span className="text-xs font-medium mx-1">VND</span>
          </p>
          <p className="text-lg font-medium text-black dark:text-white">
            Total tax: 0 <span className="text-xs font-medium mx-1">VND</span>
          </p>
        </div>
      </div>

      <div>
        <div className="relative mt-10 overflow-x-auto sm:rounded-lg">
          <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <caption className="font-medium mb-5 text-lg">Order Items</caption>
            <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
              <tr>
                <th scope="col" className="px-6 py-3">
                  #
                </th>
                <th scope="col" className="px-6 py-3">
                  <span className="sr-only">Image</span>
                </th>
                <th scope="col" className="px-6 py-3">
                  Product
                </th>
                <th scope="col" className="px-6 py-3">
                  Qty
                </th>
                <th scope="col" className="px-6 py-3">
                  Price
                </th>
                <th scope="col" className="px-6 py-3">
                  Size
                </th>
                <th scope="col" className="px-6 py-3">
                  Color
                </th>
                {/* <th scope="col" className="px-6 py-3">
                  Status
                </th> */}
                <th scope="col" className="px-6 py-3">
                  Action
                </th>
              </tr>
            </thead>
            <tbody>
              {order &&
                order.map((orderItem, i) => {
                  return <OrderItemRow key={i} nth={i + 1} item={orderItem} />;
                })}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default OrderDetails;
