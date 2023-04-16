import React, { useContext, useEffect, useState } from "react";

import { DeliveryMethodStep } from "./FirstStep";
import { PaymentStep } from "./SecondStep";
import { OrderReviewStep } from "./ThirdStep";
import { useCheckoutInfo } from "features/checkout/checkoutSlice";
import { orderProducts } from "services/users";
import { useNavigate } from "react-router-dom";
import { clearBag } from "features/bag/bagSlice";

const CheckoutStepContext = React.createContext({});
export const useCheckoutStepContext = () => useContext(CheckoutStepContext);

function Steps() {
  const [step, setStep] = useState(1);
  const checkoutInfo = useCheckoutInfo();
  const navigate = useNavigate();

  useEffect(() => {
    if (step === 4) {
      console.log(checkoutInfo);
      orderProducts(checkoutInfo)
        .then((data) => {
          console.log(data);

          alert("Placed order successfully!");
          navigate("/shop", { replace: true });

          clearBag();
        })
        .catch((err) => {
          console.log(err);
        });
    }
  }, [step, checkoutInfo, navigate]);

  return (
    <CheckoutStepContext.Provider value={{ step, setStep }}>
      <div className="steps grid-col-span-2">
        <DeliveryMethodStep nextStep={2} />
        <PaymentStep nextStep={3} />
        <OrderReviewStep nextStep={4} />
      </div>
    </CheckoutStepContext.Provider>
  );
}

export default Steps;
