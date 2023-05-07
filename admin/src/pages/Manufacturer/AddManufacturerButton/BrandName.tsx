import React from "react";
import { useValidatedInput } from "./hooks";
import { ManufacturerInputType } from "../../../types";
import BrandNameInput from "../_component/BrandNameInput";

function BrandName() {
  const { additionalClasses, errorMessage, handleChange, value } =
    useValidatedInput(ManufacturerInputType.BRAND_NAME);

  return (
    <BrandNameInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default BrandName;
