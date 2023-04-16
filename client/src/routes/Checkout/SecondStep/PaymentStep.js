import React from "react";

import Step from "../Step";
import { useCheckoutStepContext } from "../Steps";
import CreditCards from "../CreditCards/index.js";

// Redux
import { updatePaymentInfo } from "features/checkout/checkoutSlice";
import { useDispatch } from "react-redux";

function PaymentStep({ nextStep }) {
  const dispatch = useDispatch();

  const { setStep } = useCheckoutStepContext();

  return (
    <Step ownStep={2} title="Payment">
      {({ handleDone }) => {
        return (
          <CreditCards
            handleNextStep={(paymentInfo) => {
              setStep(nextStep);
              handleDone();

              // update checkout info (Redux)
              dispatch(updatePaymentInfo(paymentInfo));
            }}
          />
        );
      }}
    </Step>
  );
}

export default PaymentStep;
