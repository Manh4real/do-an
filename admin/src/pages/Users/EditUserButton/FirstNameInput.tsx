import React from "react";

import { InputType } from "../../../types";
import { useValidatedInput } from "./hooks";
import FirstNameInput from "../_components/FirstNameInput";

function FirstName() {
  console.log("FirstName");
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(InputType.FIRSTNAME);

  return (
    <FirstNameInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default FirstName;
