import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import ProductNameInput from "../_components/ProductNameInput";

function ProductName() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.NAME);

  return (
    <ProductNameInput
      value={value.toString()}
      additionalClasses={additionalClasses}
      handleChange={handleChange}
      errorMessage={errorMessage}
    />
  );
}

export default ProductName;
