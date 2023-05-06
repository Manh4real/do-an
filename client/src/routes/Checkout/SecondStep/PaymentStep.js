import React from "react";

import Step from "../Step";
import { useCheckoutStepContext } from "../Steps";
// import CreditCards from "../CreditCards/index.js";

// Redux
import {
  updatePaymentInfo,
  useCheckoutInfo,
} from "features/checkout/checkoutSlice";
import { useDispatch } from "react-redux";
import StripePayment from "./StripePayment";

function PaymentStep({ nextStep }) {
  const dispatch = useDispatch();
  const checkoutInfo = useCheckoutInfo();

  const { setStep } = useCheckoutStepContext();

  return (
    <Step ownStep={2} title="Payment">
      {({ handleDone }) => {
        return (
          <>
            <StripePayment
              items={checkoutInfo.products}
              userEmail={checkoutInfo.delivery?.email}
              handleNextStep={(paymentInfo) => {
                setStep(nextStep);
                handleDone();

                // update checkout info (Redux)
                dispatch(updatePaymentInfo(paymentInfo));
              }}
            />
            {/* <CreditCards
              handleNextStep={(paymentInfo) => {
                setStep(nextStep);
                handleDone();

                // update checkout info (Redux)
                dispatch(updatePaymentInfo(paymentInfo));
              }}
            /> */}
          </>
        );
      }}
    </Step>
  );
}

export default PaymentStep;
