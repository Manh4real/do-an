import { useCheckoutInfo } from "features/checkout/checkoutSlice";
import React from "react";

import Step from "../Step";
import { useCheckoutStepContext } from "../Steps";

function OrderReviewStep({ nextStep }) {
  const checkoutInfo = useCheckoutInfo();

  const { setStep } = useCheckoutStepContext();

  const payment = checkoutInfo.payment;
  const delivery = checkoutInfo.delivery;

  return (
    <Step ownStep={3} title="Order Review">
      {({ handleDone }) => {
        if (!payment || !delivery) return;

        return (
          <div className="checkout__step-content">
            <label style={{ fontWeight: "bold" }}>Payment:</label>
            <p>Card number: {payment.data.number}</p>
            <p>Owner: {payment.data.name}</p>
            <p>Expiry: {payment.data.expiry}</p>
            <p>CVC: {payment.data.cvc}</p>
            <p>Issuer: {payment.data.issuer}</p>
            {/* <p>{JSON.stringify(payment)}</p> */}

            <label className="mt-25" style={{ fontWeight: "bold" }}>
              Address:
            </label>
            <p>
              {delivery?.address?.province?.text ||
                delivery?.address?.province ||
                ""}
              ,{" "}
              {delivery?.address?.district?.text ||
                delivery?.address?.district ||
                ""}
              , {delivery?.address?.ward?.text || delivery?.address?.ward || ""}
            </p>
            <p>{delivery.address.additional}</p>
            {/* <p>{delivery.checked["ship-p"]}</p> */}

            <label className="mt-25" style={{ fontWeight: "bold" }}>
              Receiver:
            </label>
            <p className="capitalized-text">
              Name: {delivery.name.firstName + " " + delivery.name.lastName}
            </p>
            <p>Phone: {delivery.phone}</p>

            <button
              className="mt-25 checkout__form-button primary hover-w-fade"
              onClick={() => {
                setStep(nextStep);
                handleDone();
              }}
            >
              FINISH & ORDER
            </button>
          </div>
        );
      }}
    </Step>
  );
}

export default OrderReviewStep;
