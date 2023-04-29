import React, { useState } from "react";

import { useEditFormStore } from "../../../store/product/editForm";
import GenderInput from "../_components/GenderInput";

type IGender = "male" | "female" | "unisex";
function Gender() {
  const editFormStore = useEditFormStore();

  const [gender, setGender] = useState<IGender>(() => {
    return editFormStore.data === null
      ? "male"
      : (editFormStore.data.gender.value as IGender);
  });

  const handleChange = (type: IGender) => {
    setGender(type);

    editFormStore.updateData({
      gender: {
        value: type,
        isValid: true,
      },
    });
  };

  return <GenderInput gender={gender} handleChange={handleChange} />;
}

export default Gender;
