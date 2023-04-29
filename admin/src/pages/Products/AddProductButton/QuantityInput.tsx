import React, { useState } from "react";

import { IProductFormData, ISize, ProductInputType } from "../../../types";
// import { useValidatedInput } from "./hooks";
import QuantityInput from "../_components/QuantityInput";
import { useAddFormStore } from "../../../store/product/addForm";
import Validation from "../../../validation";

interface Props {
  size: ISize;
  colorId: string;
  colorName: string;
}

function Quantity({ colorName, colorId, size }: Props) {
  const addFormStore = useAddFormStore();

  const [value, setValue] = useState<IProductFormData[ProductInputType]>(
    addFormStore.data.stock.value[colorId]?.find(
      (s) => s.size_id === size.size_id
    )?.quantity || 1
  );
  const [firstLoaded, setFirstLoaded] = useState(true);
  const validation = new Validation();

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    setValue(e.target.value);
    setFirstLoaded(false);

    const v = validate(ProductInputType.QUANTITY, e.target.value);
    addFormStore.updateData({
      quantity: {
        value: addFormStore.data.quantity.value + Number(e.target.value),
        isValid: v.isValid,
      },
      stock: {
        value: {
          ...addFormStore.data.stock.value,
          [colorId]: addFormStore.data.stock.value[colorId].map((s) => {
            if (s.color_id === colorId && s.size_id === size.size_id) {
              return {
                color_id: colorId,
                size_id: size.size_id,
                quantity: Number(e.target.value),
              };
            }

            return s;
          }),
        },
        isValid: true,
      },
    });
  };
  const validate = (inputType: ProductInputType, value: string) => {
    switch (inputType) {
      case ProductInputType.NAME:
        return validation.validateProductName(value);
      case ProductInputType.CATEGORY:
        return validation.validateCategory(value);
      case ProductInputType.DESCRIPTION:
        return validation.validateDescription(value);
      case ProductInputType.TARGET:
        return validation.validateTarget(value);
      case ProductInputType.PRICE:
        return validation.validateNumber(value);
      case ProductInputType.QUANTITY:
        return validation.validateNumber(value);

      default:
        return { isValid: false, errorMessage: "Something went wrong" };
    }
  };

  const responseError =
    addFormStore.data[ProductInputType.QUANTITY].resonseError;

  const isValid = validate(ProductInputType.QUANTITY, value.toString()).isValid;
  const errorMessage =
    responseError ||
    (!firstLoaded && !isValid
      ? validate(ProductInputType.QUANTITY, value.toString()).errorMessage
      : "");

  const invalidInputClasses = "ring-red-600 ";
  const additionalClasses =
    responseError || (!firstLoaded && !isValid) ? invalidInputClasses : "";

  return (
    <QuantityInput
      additionalClasses={additionalClasses}
      errorMessage={errorMessage}
      handleChange={handleChange}
      value={value.toString()}
      size={size}
      colorName={colorName}
    />
  );
}

export default Quantity;
