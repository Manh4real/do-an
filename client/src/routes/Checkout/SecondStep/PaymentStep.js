import React, { useState } from "react";
import clsx from "clsx";

import Step from "../Step";
import { useCheckoutStepContext } from "../Steps";

// Redux
import {
  updatePaymentInfo,
  useCheckoutInfo,
} from "features/checkout/checkoutSlice";
import { useDispatch } from "react-redux";
import StripePayment from "./StripePayment";
import Vnpayment from "./Vnpayment";
import CreditCards from "../CreditCards";

import styles from "./PaymentStep.module.css";

const PAYMENT_METHOD = {
  PAY_LATER: "Payment on delivery",
  STRIPE: "Stripe",
  FIXED_CARD: "fixed card",
  VNP: "VNPay",
};
function PaymentStep({ nextStep }) {
  const dispatch = useDispatch();
  const checkoutInfo = useCheckoutInfo();

  const { setStep } = useCheckoutStepContext();

  const [method, setMethod] = useState(PAYMENT_METHOD.PAY_LATER);

  return (
    <Step ownStep={2} title="Payment">
      {({ handleDone }) => {
        return (
          <div>
            <div className="flex-center gap-15">
              <label
                htmlFor="payment-method__later"
                className={clsx(
                  styles.label,
                  "flex-start mb-10 grey-border p-10",
                  {
                    [styles.active]: method === PAYMENT_METHOD.PAY_LATER,
                  }
                )}
              >
                <input
                  type="radio"
                  name="payment-method"
                  className="d-hidden"
                  id="payment-method__later"
                  checked={method === PAYMENT_METHOD.PAY_LATER}
                  onChange={() => {
                    setMethod(PAYMENT_METHOD.PAY_LATER);
                  }}
                />
                Payment on Delivery
              </label>
              <label
                htmlFor="payment-method__stripe"
                className={clsx(
                  styles.label,
                  "flex-start mb-10 grey-border p-10",
                  {
                    [styles.active]: method === PAYMENT_METHOD.STRIPE,
                  }
                )}
              >
                <input
                  type="radio"
                  name="payment-method"
                  id="payment-method__stripe"
                  className="d-hidden"
                  checked={method === PAYMENT_METHOD.STRIPE}
                  onChange={() => {
                    setMethod(PAYMENT_METHOD.STRIPE);
                  }}
                />
                <span className="d-hidden">Stripe</span>
                <img
                  src="/images/stripe-logo.png"
                  width="50px"
                  alt="stripe logo"
                />
              </label>
              <label
                htmlFor="payment-method__vnp"
                className={clsx(
                  styles.label,
                  "flex-start mb-10 grey-border p-10",
                  {
                    [styles.active]: method === PAYMENT_METHOD.VNP,
                  }
                )}
              >
                <input
                  type="radio"
                  name="payment-method"
                  id="payment-method__vnp"
                  className="d-hidden"
                  checked={method === PAYMENT_METHOD.VNP}
                  onChange={() => {
                    setMethod(PAYMENT_METHOD.VNP);
                  }}
                />
                <span className="d-hidden">VNPay</span>
                {/* <img
                  src="/images/vnpay-logo.png"
                  width="40px"
                  alt="stripe logo"
                /> */}
                <img
                  src="/images/vnpay-logo-2.svg"
                  width="80px"
                  alt="stripe logo"
                />
              </label>
              <label
                htmlFor="payment-method__fixed"
                className={clsx(
                  styles.label,
                  "flex-start mb-10 grey-border p-10",
                  {
                    [styles.active]: method === PAYMENT_METHOD.FIXED_CARD,
                  }
                )}
              >
                <input
                  type="radio"
                  name="payment-method"
                  id="payment-method__fixed"
                  className="d-hidden"
                  checked={method === PAYMENT_METHOD.FIXED_CARD}
                  onChange={() => {
                    setMethod(PAYMENT_METHOD.FIXED_CARD);
                  }}
                />
                <span className="d-hidden">Fixed card</span>
                Fixed Card
              </label>
            </div>

            <div className="mt-25">
              {method === PAYMENT_METHOD.PAY_LATER && (
                <button
                  className="checkout__form-button primary hover-w-fade"
                  onClick={() => {
                    setStep(nextStep);
                    handleDone();

                    // update checkout info (Redux)
                    dispatch(updatePaymentInfo("success"));
                  }}
                >
                  Proceed order
                </button>
              )}

              {method === PAYMENT_METHOD.VNP && <Vnpayment />}

              {method === PAYMENT_METHOD.FIXED_CARD && (
                <CreditCards
                  handleNextStep={(paymentInfo) => {
                    setStep(nextStep);
                    handleDone();

                    // update checkout info (Redux)
                    dispatch(updatePaymentInfo(paymentInfo));
                  }}
                />
              )}

              {method === PAYMENT_METHOD.STRIPE && (
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
              )}
            </div>
          </div>
        );
      }}
    </Step>
  );
}

// function PaymentStep({ nextStep }) {
//   const dispatch = useDispatch();

//   const { setStep } = useCheckoutStepContext();

//   return (
//     <Step ownStep={2} title="Payment">
//       {({ handleDone }) => {
//         return (
//           <>
//             <CreditCards
//               handleNextStep={(paymentInfo) => {
//                 setStep(nextStep);
//                 handleDone();

//                 // update checkout info (Redux)
//                 dispatch(updatePaymentInfo(paymentInfo));
//               }}
//             />
//           </>
//         );
//       }}
//     </Step>
//   );
// }

export default PaymentStep;
