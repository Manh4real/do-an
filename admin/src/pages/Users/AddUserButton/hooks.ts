import { useState } from "react";

import Validation from "../../../validation";
import { InputType } from "../../../types";

import { useAddFormStore } from "../../../store/addForm";

export const useValidatedInput = (type: InputType) => {
    const addFormStore = useAddFormStore();

    const [value, setValue] = useState<string>(addFormStore.data[type].value);
    const [firstLoaded, setFirstLoaded] = useState(true);
    const validation = new Validation();

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
        setFirstLoaded(false);

        const v = validate(type, e.target.value);
        addFormStore.updateData({
            [type]: {
                value: e.target.value,
                isValid: v.isValid
            }
        })
    };
    const validate = (inputType: InputType, value: string) => {
        switch (inputType) {
            case InputType.EMAIL:
                return validation.validateEmail(value)
            case InputType.PASSWORD:
                return validation.validatePassword(value)
            case InputType.FIRSTNAME:
                return validation.validateName(value)
            case InputType.LASTNAME:
                return validation.validateName(value)

            default: return { isValid: false, errorMessage: "Something went wrong" };
        }
    }

    const responseError = addFormStore.data[type].resonseError;

    const isValid = validate(type, value).isValid;
    const errorMessage = responseError || ((!firstLoaded && !isValid) ? validate(type, value).errorMessage : "");

    const invalidInputClasses = "ring-red-600 ";
    const additionalClasses = responseError || (!firstLoaded && !isValid) ? invalidInputClasses : "";

    return {
        value,
        handleChange,
        additionalClasses,
        errorMessage
    }
}