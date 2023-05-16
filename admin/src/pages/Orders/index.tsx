import React, { useState, useEffect, useMemo } from "react";
import { Link, useSearchParams } from "react-router-dom";

import { ArrowLeft, ArrowRight } from "../../Icons";

import Spinner from "../../components/Spinner";

// import { getOrders } from "../../services/orders";

import { IOrders } from "../../types";
import { RefreshContextProvider } from "../../context";
import { useExportToPDF } from "../../hooks";
import ExportButton from "../../components/ExportButton";
import OrderSearch from "./OrderSearch";
import OrderTableRow from "./OrderTableRow";
import { getOrders } from "../../services/orders";
import { getOrderStatuses } from "../../services/misc";
import RefreshButton from "../../components/RefreshButton";
import { IOrderStatusState } from "./types";

interface ITotal {
  // page: number;
  orders: number;
}

const ORDERS_PER_PAGE = 4;
const cachedOrders = new Map();
function Orders() {
  const [orders, setOrders] = useState<IOrders>({});
  const [statuses, setStatuses] = useState<IOrderStatusState[]>([]);
  const [activeStatus, setActiveStatus] = useState<IOrderStatusState>();
  const [loading, setLoading] = useState(false);

  const [searchParams] = useSearchParams();
  const [total, setTotal] = useState<ITotal>({ orders: 0 });

  const currentPage = Number(searchParams.get("page")) || 1;
  const totalPage = 1;
  const totalOrders = total.orders;

  const disabledClasses = "text-gray-300 pointer-events-none";

  const [refresh, setRefresh] = useState(false);
  const refreshContextValue = useMemo(() => {
    return {
      handleRefresh: () => {
        setRefresh(true);
      },
      refresh,
    };
  }, [refresh]);

  // EXPORT TO PDF FILE
  //#region
  const { container, exportPDFWithMethod } = useExportToPDF({
    title: `Order Records for ${new Date().getFullYear()}`,
    fileName: `Order Records for ${new Date().getFullYear()}`,
  });
  //#endregion

  useEffect(() => {
    let ignore = false;

    if (refresh) {
      if (activeStatus) {
        setLoading(true);
        getOrders(currentPage, activeStatus.order_status_id)
          .then((data) => {
            if (!ignore) {
              setOrders(data.data.orders);
              setTotal({
                orders: data.total,
                // page: data.meta.pagination.total_page,
              });

              cachedOrders.clear();
              cachedOrders.set(
                activeStatus.order_status_name,
                data.data.orders
              );
              cachedOrders.set("total", {
                // page: data.meta.pagination.total_page,
                orders: data.total,
              });
            }
          })
          .finally(() => {
            setRefresh(false);
            setLoading(false);
          });
      }
    } else {
      if (!activeStatus) return;

      if (cachedOrders.get(activeStatus.order_status_name)) {
        setOrders(cachedOrders.get(activeStatus.order_status_name));
        setTotal(cachedOrders.get("total"));
        console.log(
          "Get cached orders of status " + activeStatus.order_status_name
        );
      } else {
        setLoading(true);
        getOrders(currentPage, activeStatus.order_status_id)
          .then((data) => {
            if (!ignore) {
              setOrders(data.data.orders);
              setTotal({
                orders: data.total,
                // page: data.meta.pagination.total_page,
              });

              if (!cachedOrders.get(activeStatus.order_status_name)) {
                cachedOrders.set(
                  activeStatus.order_status_name,
                  data.data.orders
                );
              }
              if (!cachedOrders.get("total")) {
                cachedOrders.set("total", {
                  // page: data.meta.pagination.total_page,
                  orders: data.total,
                });
              }
            }
          })
          .finally(() => {
            setLoading(false);
          });
      }
    }

    return () => {
      ignore = true;
    };
  }, [activeStatus, currentPage, refresh, total]);

  useEffect(() => {
    getOrderStatuses().then((data) => {
      setStatuses(data.data.order_statuses);
      setActiveStatus(data.data.order_statuses[0]);
    });
  }, []);

  const normalTabClass =
    "border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300";
  const activeTabClass =
    "text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500";

  const sortedOrders = useMemo(() => {
    return Object.entries(orders).sort(([a, b], [a1, b1]) => (a < a1 ? 1 : -1));
  }, [orders]);

  return (
    <RefreshContextProvider value={refreshContextValue}>
      <section className="container px-4 mx-auto mb-10">
        <div className="flex justify-between px-2">
          <div className="flex items-center gap-x-3">
            <h2 className="uppercase text-lg font-bold text-gray-800">
              Orders
            </h2>
            <span className="upp px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
              {totalOrders} orders
            </span>
            <OrderSearch />
            <RefreshButton
              handleClick={() => {
                setRefresh(true);
              }}
            />
          </div>
          <div className="flex items-center gap-2">
            <ExportButton exportPDFWithMethod={exportPDFWithMethod} />
          </div>
        </div>
        <div className="flex flex-col mt-6">
          <div className="text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
            <ul className="flex flex-wrap -mb-px">
              {statuses.map((status) => {
                const additionalClasses =
                  status.order_status_id === activeStatus?.order_status_id
                    ? activeTabClass
                    : normalTabClass;

                return (
                  <li key={status.order_status_name} className="mr-2">
                    <button
                      onClick={() => {
                        setActiveStatus(status);
                      }}
                      className={
                        "inline-block p-4 capitalize " + additionalClasses
                      }
                    >
                      {status.order_status_name}
                    </button>
                  </li>
                );
              })}
            </ul>
          </div>

          <div className="-mx-4 my-2 overflow-x-auto">
            <div className="inline-block min-w-full py-2 align-middle md:px-4 lg:px-6">
              <div
                ref={container}
                className="overflow-hidden border border-gray-200 md:rounded-lg"
              >
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        #
                      </th>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <div className="flex items-center gap-x-3">
                          Order ID
                        </div>
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <button className="flex items-center gap-x-2">
                          <span>Customer</span>
                        </button>
                      </th>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <div className="flex items-center gap-x-3">
                          <span>Order Items</span>
                        </div>
                      </th>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <div className="flex items-center gap-x-3">Payment</div>
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        Est. Arrived date
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        Created at
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        Total price
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <button className="flex items-center gap-x-2">
                          <span>Status</span>
                        </button>
                      </th>
                      <th scope="col" className="relative py-3.5 px-4">
                        <span className="sr-only">Edit</span>
                      </th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {loading && (
                      <tr>
                        <td>
                          <div className="m-auto w-max my-3">
                            <Spinner />
                          </div>
                        </td>
                      </tr>
                    )}
                    {!loading && Object.keys(orders).length === 0 && (
                      <tr>
                        <td
                          colSpan={8}
                          className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap"
                        >
                          <div className="py-3 text-center">
                            No orders found
                          </div>
                        </td>
                      </tr>
                    )}
                    {!loading &&
                      Object.keys(orders).length > 0 &&
                      sortedOrders.map(([orderId, orderItems], i) => {
                        return (
                          <OrderTableRow
                            key={orderId}
                            nth={(currentPage - 1) * ORDERS_PER_PAGE + (i + 1)}
                            order={{
                              address: orderItems[0].address,
                              created_at: orderItems[0].created_at,
                              customer_name: orderItems[0].customer_name,
                              email: orderItems[0].email,
                              est_arrived_date: orderItems[0].est_arrived_date,
                              order_id: orderItems[0].order_id,
                              phone: orderItems[0].phone,
                              receiver: orderItems[0].receiver,
                              status: orderItems[0].status,
                              order_status_id: orderItems[0].order_status_id,
                              order_status_name:
                                orderItems[0].order_status_name,
                              total_price: orderItems[0].total_price,
                              user_id: orderItems[0].user_id,
                              payment_status_name:
                                orderItems[0].payment_status_name,
                            }}
                            orderItems={orderItems.map((item) => ({
                              order_item_id: item.order_item_id,
                              product: item.product,
                              product_id: item.product_id,
                              quantity: item.quantity,
                              size: item.size,
                              color_id: item.color_id,
                              color_name: item.color_name,
                            }))}
                          />
                        );
                      })}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        {currentPage > totalPage ? (
          ""
        ) : (
          <div className="flex items-center justify-between mt-6 lg:px-2">
            <Link
              to={"?page=" + (currentPage - 1 > 1 ? currentPage - 1 : 1)}
              className={
                "flex items-center px-5 py-2 text-sm capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 " +
                (currentPage - 1 < 1 ? disabledClasses : "text-gray-700")
              }
            >
              <ArrowLeft />
              <span>previous</span>
            </Link>
            <div className="items-center hidden lg:flex gap-x-3">
              {new Array(totalPage).fill(1).map((_, i) => {
                return (
                  <PageNumber
                    key={i}
                    number={i + 1}
                    active={i + 1 === currentPage}
                  />
                );
              })}
            </div>
            <Link
              to={
                "?page=" +
                (currentPage + 1 <= totalPage ? currentPage + 1 : currentPage)
              }
              className={
                "flex items-center px-5 py-2 text-sm capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 " +
                (currentPage + 1 > totalPage
                  ? disabledClasses
                  : "text-gray-700")
              }
            >
              <span>Next</span>
              <ArrowRight />
            </Link>
          </div>
        )}
      </section>
    </RefreshContextProvider>
  );
}

const PageNumber = ({
  number,
  active = false,
}: {
  number: number;
  active?: boolean;
}) => {
  return (
    <Link
      to={"?page=" + number}
      className={
        active
          ? "px-2 py-1 text-sm text-blue-500 rounded-md bg-blue-100/60"
          : "px-2 py-1 text-sm text-gray-500 rounded-md hover:bg-gray-100"
      }
    >
      {number}
    </Link>
  );
};

export default Orders;
