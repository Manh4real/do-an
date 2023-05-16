import { payment } from "api";
import Spinner from "components/Spinner";
import {
  updateOrderId,
  useCheckoutInfo,
} from "features/checkout/checkoutSlice";
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import { useLocation } from "react-router-dom";
import { createOrderReserveStock } from "services/users";

function Vnpayment() {
  const checkoutInfo = useCheckoutInfo();
  const location = useLocation();
  const [loading, setLoading] = useState(false);
  const dispatch = useDispatch();

  const handleVNPayment = async () => {
    let orderId;

    if (!checkoutInfo.orderId) {
      const createOrderResponse = await createOrderReserveStock(checkoutInfo);
      orderId = createOrderResponse.data.order_id;
      dispatch(updateOrderId(orderId));
    } else {
      orderId = checkoutInfo.orderId;
    }

    const now = new Date();
    const currentTime =
      now.toLocaleDateString() + " " + now.toLocaleTimeString();

    setLoading(true);
    payment
      .post("/vnp/create_payment_url/", {
        orderId: orderId,
        // amount: 10_000_000,
        items: checkoutInfo.products.products.map((p) => ({
          product_id: p.product_id,
          added: p.added,
        })),
        bankCode: "",
        orderDescription: "Payment Order on " + currentTime,
        orderType: "200000", // Thời trang
        redirectUrl: location.pathname + location.search,
      })
      .then((response) => {
        if (response.data.redirect) {
          window.open(response.data.redirect, "_self");
        }
      })
      .finally(() => {
        setLoading(false);
      });
  };

  return (
    <button
      onClick={() => {
        handleVNPayment();
      }}
      className="black-border grey-bg p-10 hover-w-fade regular-font flex-center gap-15"
    >
      {loading && <Spinner />}
      Go to
      <span className="d-hidden">VNPay</span>
      <img src="/images/vnpay-logo-2.svg" width="80px" alt="stripe logo" />
    </button>
  );
}

export default Vnpayment;
