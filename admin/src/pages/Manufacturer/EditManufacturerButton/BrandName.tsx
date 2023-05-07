import React from "react";
import { useValidatedInput } from "./hooks";
import { ManufacturerInputType } from "../../../types";
import ManufacturerNameInput from "../_component/ManufacturerNameInput";

function BrandName() {
  const { additionalClasses, errorMessage, handleChange, value } =
    useValidatedInput(ManufacturerInputType.BRAND_NAME);

  return (
    <ManufacturerNameInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default BrandName;
