import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import ProductNameInput from "../_components/ProductNameInput";

function ProductName() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.NAME);

  return (
    <ProductNameInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value.toString()}
    />
  );
}

export default ProductName;
