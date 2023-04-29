import { useState } from "react";

import Validation from "../../../validation";
import { ProductInputType } from "../../../types";

import { useEditFormStore } from "../../../store/product/editForm";

export const useValidatedInput = (type: Exclude<ProductInputType, "password">) => {
    const editFormStore = useEditFormStore();

    const [value, setValue] = useState<string | number>(() => {
        const data = editFormStore.data;

        return data === null ? "" : data[type].value;
    });
    const validation = new Validation();

    const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>) => {
        setValue(e.target.value);

        const v = validate(type, e.target.value);
        editFormStore.updateData({
            [type]: {
                value: e.target.value,
                isValid: v.isValid
            }
        })
    };
    const validate = (inputType: ProductInputType, value: string | number) => {
        switch (inputType) {
            case ProductInputType.NAME:
                return validation.validateProductName(value.toString())
            case ProductInputType.CATEGORY:
                return validation.validateCategory(value.toString())
            case ProductInputType.DESCRIPTION:
                return validation.validateDescription(value.toString())
            case ProductInputType.TARGET:
                return validation.validateTarget(value.toString())
            case ProductInputType.PRICE:
                return validation.validateNumber(value.toString())
            case ProductInputType.QUANTITY:
                return validation.validateNumber(value.toString())

            default: return { isValid: false, errorMessage: "Something went wrong" };
        }
    }

    const responseError = editFormStore.data && editFormStore.data[type].resonseError;

    const isValid = validate(type, value).isValid;
    const errorMessage = responseError || ((!isValid) ? validate(type, value).errorMessage : "");

    const invalidInputClasses = "ring-red-600 ";
    const additionalClasses = responseError || (!isValid) ? invalidInputClasses : "";

    return {
        value,
        handleChange,
        additionalClasses,
        errorMessage
    }
}