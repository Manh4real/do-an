import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import TargetInput from "../_components/TargetInput";

function Target() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.TARGET);

  return (
    <TargetInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value.toString()}
    />
  );
}

export default Target;
