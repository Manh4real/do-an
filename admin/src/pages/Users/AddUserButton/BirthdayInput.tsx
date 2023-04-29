import React, { useState } from "react";

import { useAddFormStore } from "../../../store/addForm";
import Validation from "../../../validation";
import BirthdayInput from "../_components/BirthdayInput";

function Birthday() {
  const addFormStore = useAddFormStore();
  const validation = new Validation();

  const [value, setValue] = useState<string>(addFormStore.data.birthday.value);
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setValue(e.target.value);

    const checkObj = validate(e.target.value);

    addFormStore.updateData({
      birthday: {
        value: e.target.value,
        ...checkObj,
      },
    });
  };

  const validate = (value: string) => {
    const birthday = new Date(value);

    let checkObj = {
      isValid: true,
      errorMessage: "",
    };
    if (birthday.toString() === "Invalid Date") {
      checkObj.isValid = false;
      checkObj.errorMessage = "Invalid date";
    } else {
      checkObj = validation.validateBirthday(birthday);
    }

    return checkObj;
  };

  const checkObj = validate(value);
  const errorMessage = checkObj.errorMessage;
  const isValid = checkObj.isValid;

  const invalidInputClasses = "border-red-600 ";
  const additionalClasses = !isValid ? invalidInputClasses : "";

  return (
    <BirthdayInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value}
    />
  );
}

export default Birthday;
