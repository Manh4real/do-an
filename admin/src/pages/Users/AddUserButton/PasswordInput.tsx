import React from "react";

import { useValidatedInput } from "./hooks";
import { InputType } from "../../../types";
import PasswordInput from "../_components/PasswordInput";

function Password() {
  const { value, additionalClasses, handleChange, errorMessage } =
    useValidatedInput(InputType.PASSWORD);

  return (
    <PasswordInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default Password;
