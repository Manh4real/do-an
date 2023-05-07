import React from "react";
import { useValidatedInput } from "./hooks";
import { ProductTypeInputType } from "../../../types";
import ProductTypeNameInput from "../_component/ProductTypeNameInput";

function ProductTypeName() {
  const { additionalClasses, errorMessage, handleChange, value } =
    useValidatedInput(ProductTypeInputType.TYPE_NAME);

  return (
    <ProductTypeNameInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default ProductTypeName;
