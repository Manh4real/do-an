import React from "react";

import { useValidatedInput } from "./hooks";
import { InputType } from "../../../types";
import EmailInput from "../_components/EmailInput";

function Email() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(InputType.EMAIL);

  return (
    <EmailInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default Email;
