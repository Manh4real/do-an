import { formatCurrency } from "helpers";
import React from "react";
import { stringifyDate } from "script";
import OrderItem, { ORDER_STATUS } from "./OrderItem";
import clsx from "clsx";
import { updateOrder } from "services/misc";
import { useRefreshCotnext } from "./context";

const PAYMENT_STATUS = {
  initial: "0",
  success: "1",
  failed: "2",
};

function OrderItems({ orderId, orderItems }) {
  const orderedDate = orderItems[0].created_at;
  const shippingFee = 30000;
  // const tax = 0;
  // orderItems[0].total_price ||
  const totalPrice =
    orderItems[0].total_price ||
    orderItems.reduce((acc, orderItem) => {
      // return acc + orderItem.quantity * orderItem.product.price;
      return acc + orderItem.total_price;
    }, 0) + shippingFee;

  let paymentStatusColor = "grey-font";

  if (PAYMENT_STATUS.failed === orderItems[0].payment_status_id) {
    paymentStatusColor = "red-font";
  } else if (PAYMENT_STATUS.initial === orderItems[0].payment_status_id) {
    paymentStatusColor = "orange-font";
  } else if (PAYMENT_STATUS.success === orderItems[0].payment_status_id) {
    paymentStatusColor = "green-font";
  }

  const isOrderProcessing =
    orderItems[0].order_status_id === ORDER_STATUS.processing;
  const isOrderCanceled =
    orderItems[0].order_status_id === ORDER_STATUS.canceled;
  const isOrderDone = orderItems[0].order_status_id === ORDER_STATUS.done;
  const isOrderReady = orderItems[0].order_status_id === ORDER_STATUS.ready;
  const isOrderDelivering =
    orderItems[0].order_status_id === ORDER_STATUS.delivering;

  // const navigate = useNavigate();
  const { handleRefresh } = useRefreshCotnext();

  const handleCancelOrder = () => {
    if (!isOrderProcessing && !isOrderReady) return;

    updateOrder({ orderId, status: ORDER_STATUS.canceled }).then((ok) => {
      if (ok) {
        alert("Canceled order successfully!");
        // navigate(0);
        handleRefresh(true);
      } else alert("Failed to cancel order");
    });
  };
  // const handleReorder = (orderItems) => {

  // }

  return (
    <React.Fragment>
      <div className="flex-spbw mt-25 medium-font order-title mt-25 grey-bg">
        <div>
          <span className="grey-font underlined">#{orderId}</span>
          <span className="ml-10">
            Placed order on
            <span className="ml-10">
              {stringifyDate(new Date(orderedDate), true, false, true)}
              &nbsp;
              <small className="grey-font">
                {new Date(orderedDate).toLocaleTimeString()}
              </small>
            </span>
            <p className="ml-50 regular-font">
              <small style={{ marginLeft: -5 }}>
                Payment: {orderItems[0].payment_method_name}
              </small>
              &nbsp;
              <small className={`${paymentStatusColor} capitalized-text ml-10`}>
                {orderItems[0].payment_status_name}
              </small>
            </p>
          </span>
        </div>
        <div>
          <span className="ml-auto bold-font order-total-price">
            Total Price: {formatCurrency(totalPrice)} VND
          </span>
          <div className="small-font text-right">
            includes shipping fee: {formatCurrency(shippingFee)} VND
          </div>
        </div>
      </div>

      <p
        className="grid-item"
        style={{
          paddingBlock: 10,
          borderBottomColor: "transparent",
          borderTopColor: "transparent",
        }}
      >
        <strong>Estimated arrived date:</strong>{" "}
        {stringifyDate(
          new Date(orderItems[0].est_arrived_date),
          true,
          false,
          true
        )}
      </p>

      {orderItems.map((orderItem, i) => {
        return <OrderItem key={i} orderItem={orderItem} />;
      })}

      {!isOrderDelivering && !isOrderCanceled && !isOrderDone && (
        <div className="grid-item mb-25 text-right">
          {/* {(isOrderCanceled || isOrderDone) && (
            <button
              className={clsx("cta p-10 px-30 regular-font hover-w-fade")}
              style={{ width: 160 }}
              onClick={() => {}}
            >
              Re-order
            </button>
          )} */}
          {(isOrderProcessing || isOrderReady) && (
            <button
              className={clsx(
                "grey-bg grey-border p-10 px-30 regular-font hover-w-fade ml-10"
              )}
              style={{ width: 160 }}
              onClick={handleCancelOrder}
            >
              {isOrderProcessing || isOrderReady ? "Cancel order" : "Re-order"}
            </button>
          )}
        </div>
      )}
    </React.Fragment>
  );
}

export default OrderItems;
