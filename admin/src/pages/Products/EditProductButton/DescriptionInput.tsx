import React from "react";
import { ProductInputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import DescriptionInput from "../_components/DescriptionInput";

function Description() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(ProductInputType.DESCRIPTION);

  return (
    <DescriptionInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value.toString()}
    />
  );
}

export default Description;
