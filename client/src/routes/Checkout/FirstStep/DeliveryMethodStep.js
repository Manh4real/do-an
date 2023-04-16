import clsx from "clsx";
import React, { useEffect, useState } from "react";

import Step from "../Step";
import ShipMethod from "./ShipMethod";
import PickupMethod from "./PickupMethod";
import { useCheckoutStepContext } from "../Steps";

function DeliveryMethodStep({ nextStep }) {
  const [method, setMethod] = useState("ship");
  const [title, setTitle] = useState("");

  const { setStep } = useCheckoutStepContext();

  const handleChange = (m) => {
    setMethod(m);
  };

  useEffect(() => {
    switch (method) {
      case "ship":
        setTitle("Delivery Options");
        break;
      case "pickup":
        setTitle("Pickup");
        break;
      default:
        throw new Error("Invalid delivery method...");
    }
    setStep(1);
  }, [method, setStep]);

  return (
    <Step ownStep={1} title={title}>
      {({ handleDone }) => {
        return (
          <React.Fragment>
            <div className="tabs flex-center">
              <button
                onClick={() => handleChange("ship")}
                className={clsx(
                  "checkout__tab",
                  "checkout__block",
                  "title",
                  "flex-1",
                  {
                    active: method === "ship",
                  }
                )}
              >
                Ship
              </button>
              <button
                onClick={() => handleChange("pickup")}
                className={clsx(
                  "checkout__tab",
                  "checkout__block",
                  "title",
                  "flex-1",
                  {
                    active: method === "pickup",
                  }
                )}
              >
                Pick up
              </button>
            </div>
            {method === "ship" && (
              <ShipMethod handleDone={handleDone} nextStep={nextStep} />
            )}
            {method === "pickup" && (
              <PickupMethod handleDone={handleDone} nextStep={nextStep} />
            )}
          </React.Fragment>
        );
      }}
    </Step>
  );
}

export default DeliveryMethodStep;
