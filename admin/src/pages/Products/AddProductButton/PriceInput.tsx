import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import PriceInput from "../_components/PriceInput";

function Price() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.PRICE);

  return (
    <PriceInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value.toString()}
    />
  );
}

export default Price;
