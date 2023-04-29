import React, { useState } from "react";

import { ISize, ProductInputType } from "../../../types";
import QuantityInput from "../_components/QuantityInput";
import { useEditFormStore } from "../../../store/product/editForm";
import Validation from "../../../validation";

interface Props {
  size: ISize;
  colorId: string;
  colorName: string;
}

function Quantity({ colorId, colorName, size }: Props) {
  const editFormStore = useEditFormStore();

  const [value, setValue] = useState<number>(() => {
    const data = editFormStore.data;

    return data === null
      ? 1
      : data.changedStock.value[colorId]?.find(
          (s) => s.size_id === size.size_id
        )?.quantity || 1;
  });
  const validation = new Validation();

  const handleChange = (
    e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement>
  ) => {
    setValue(Number(e.target.value));

    const v = validate(ProductInputType.QUANTITY, e.target.value);
    const stock = editFormStore?.data?.changedStock || {
      value: { [colorId]: [] },
      isValid: true,
    };

    editFormStore.updateData({
      quantity: {
        value:
          (editFormStore.data?.quantity.value || 0) + Number(e.target.value),
        isValid: v.isValid,
      },
      changedStock: {
        value: {
          ...stock.value,
          [colorId]: stock.value[colorId].map((s) => {
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
  const validate = (inputType: ProductInputType, value: string | number) => {
    switch (inputType) {
      case ProductInputType.NAME:
        return validation.validateProductName(value.toString());
      case ProductInputType.CATEGORY:
        return validation.validateCategory(value.toString());
      case ProductInputType.DESCRIPTION:
        return validation.validateDescription(value.toString());
      case ProductInputType.TARGET:
        return validation.validateTarget(value.toString());
      case ProductInputType.PRICE:
        return validation.validateNumber(value.toString());
      case ProductInputType.QUANTITY:
        return validation.validateNumber(value.toString());

      default:
        return { isValid: false, errorMessage: "Something went wrong" };
    }
  };

  const responseError =
    editFormStore.data &&
    editFormStore.data[ProductInputType.QUANTITY].resonseError;

  const isValid = validate(ProductInputType.QUANTITY, value).isValid;
  const errorMessage =
    responseError ||
    (!isValid ? validate(ProductInputType.QUANTITY, value).errorMessage : "");

  const invalidInputClasses = "ring-red-600 ";
  const additionalClasses =
    responseError || !isValid ? invalidInputClasses : "";

  return (
    <QuantityInput
      value={value.toString()}
      additionalClasses={additionalClasses}
      handleChange={handleChange}
      errorMessage={errorMessage}
      size={size}
      colorName={colorName}
    />
  );
}

export default Quantity;
