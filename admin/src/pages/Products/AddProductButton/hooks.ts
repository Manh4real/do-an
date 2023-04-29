import { useState } from "react";

import Validation from "../../../validation";
import { IProductFormData, ProductInputType } from "../../../types";

import { useAddFormStore } from "../../../store/product/addForm";

export const useValidatedInput = (type: ProductInputType) => {
    const addFormStore = useAddFormStore();

    const [value, setValue] = useState<IProductFormData[ProductInputType]>(addFormStore.data[type].value);
    const [firstLoaded, setFirstLoaded] = useState(true);
    const validation = new Validation();

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
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
    const validate = (inputType: ProductInputType, value: string) => {
        switch (inputType) {
            case ProductInputType.NAME:
                return validation.validateProductName(value)
            case ProductInputType.CATEGORY:
                return validation.validateCategory(value)
            case ProductInputType.DESCRIPTION:
                return validation.validateDescription(value)
            case ProductInputType.TARGET:
                return validation.validateTarget(value)
            case ProductInputType.PRICE:
                return validation.validateNumber(value)
            case ProductInputType.QUANTITY:
                return validation.validateNumber(value)

            default: return { isValid: false, errorMessage: "Something went wrong" };
        }
    }

    const responseError = addFormStore.data[type].resonseError;

    const isValid = validate(type, value.toString()).isValid;
    const errorMessage = responseError || ((!firstLoaded && !isValid) ? validate(type, value.toString()).errorMessage : "");

    const invalidInputClasses = "ring-red-600 ";
    const additionalClasses = responseError || (!firstLoaded && !isValid) ? invalidInputClasses : "";

    return {
        value,
        handleChange,
        additionalClasses,
        errorMessage
    }
}