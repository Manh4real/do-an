import { useState } from "react";

import Validation from "../../../validation";
import { useEditFormStore } from "../../../store/product_type/editForm";
import { ProductTypeInputType } from "../../../types";

export const useValidatedInput = (type: ProductTypeInputType) => {
    const editFormStore = useEditFormStore();

    const [value, setValue] = useState<string>(() => {
        const data = editFormStore.data;

        return data === null ? "" : data[type].value;
    });
    const [firstLoaded, setFirstLoaded] = useState(true);
    const validation = new Validation();

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        setValue(e.target.value);
        setFirstLoaded(false);

        const v = validate(type, e.target.value);
        editFormStore.updateData({
            [type]: {
                value: e.target.value,
                isValid: v.isValid
            }
        })
    };
    const validate = (inputType: ProductTypeInputType, value: string) => {
        switch (inputType) {
            case ProductTypeInputType.TYPE_NAME:
                return validation.validateName(value)

            default: return { isValid: false, errorMessage: "Something went wrong" };
        }
    }

    const responseError = editFormStore.data && editFormStore.data[type].resonseError;

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