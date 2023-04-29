import React, { useState } from "react";

import { useAddFormStore } from "../../../store/product/addForm";
import GenderInput from "../_components/GenderInput";

type IGender = "male" | "female" | "unisex";
function Gender() {
  const addFormStore = useAddFormStore();

  const [gender, setGender] = useState<IGender>("male");

  const handleChange = (type: IGender) => {
    setGender(type);

    addFormStore.updateData({
      gender: {
        value: type,
        isValid: true,
      },
    });
  };

  return <GenderInput gender={gender} handleChange={handleChange} />;
}

export default Gender;
