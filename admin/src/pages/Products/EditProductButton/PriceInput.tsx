import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import PriceInput from "../_components/PriceInput";

function Price() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.PRICE);

  return (
    <PriceInput
      value={value.toString()}
      additionalClasses={additionalClasses}
      handleChange={handleChange}
      errorMessage={errorMessage}
    />
  );
}

export default Price;
