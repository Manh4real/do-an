import React from "react";

import Step from "../Step";
import { useCheckoutStepContext } from "../Steps";

// Redux
import {
  updatePaymentInfo,
  useCheckoutInfo,
} from "features/checkout/checkoutSlice";
import { useDispatch } from "react-redux";
import StripePayment from "./StripePayment";
// import CreditCards from "../CreditCards";

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
          </>
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
