import React from "react";

import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import CategoryInput from "../_components/CategoryInput";

function Category() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.CATEGORY);

  return (
    <CategoryInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value.toString()}
    />
  );
}

export default Category;
