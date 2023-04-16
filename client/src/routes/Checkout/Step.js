import React, { useEffect, useState } from "react";
import clsx from "clsx";

import { useCheckoutStepContext } from "./Steps";

function Step({ title, ownStep, children }) {
  const { step } = useCheckoutStepContext();
  const [done, setDone] = useState(false);
  const [isCurrentStep, setIsCurrentStep] = useState(step === ownStep);

  useEffect(() => {
    setIsCurrentStep(step === ownStep);
  }, [step, ownStep]);

  const handleDone = () => {
    setDone(true);
  };

  return (
    <details
      className="checkout__step checkout__block"
      open={!done && isCurrentStep}
    >
      <summary
        className={clsx("title", "checkout__step-title", {
          "is--disabled": !done && !isCurrentStep,
        })}
      >
        {ownStep}. {title}
      </summary>
      <div className={clsx("checkout__step-content")}>
        {children({ handleDone })}
      </div>
    </details>
  );
}

export default Step;
