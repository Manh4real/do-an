import { useState } from "react";

import Validation from "../../../validation";
import { useAddFormStore } from "../../../store/manufacturer/addForm";
import { ManufacturerInputType } from "../../../types";

export const useValidatedInput = (type: ManufacturerInputType) => {
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
    const validate = (inputType: ManufacturerInputType, value: string) => {
        switch (inputType) {
            case ManufacturerInputType.MANUFACTURER_NAME:
                return validation.validateName(value)
            case ManufacturerInputType.BRAND_NAME:
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