import React from "react";
import { useValidatedInput } from "./hooks";
import { InputType } from "../../../types";
import LastNameInput from "../_components/LastNameInput";

function LastName() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(InputType.LASTNAME);

  return (
    <LastNameInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default LastName;
