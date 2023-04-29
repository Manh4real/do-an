import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import TargetInput from "../_components/TargetInput";

function Target() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.TARGET);

  return (
    <TargetInput
      value={value.toString()}
      additionalClasses={additionalClasses}
      handleChange={handleChange}
      errorMessage={errorMessage}
    />
  );
}

export default Target;
