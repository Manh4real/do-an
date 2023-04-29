import React, { useState } from "react";

import { useAddFormStore } from "../../../store/addForm";
import { IRole } from "../../../types";
import RoleInput from "../_components/RoleInput";

function Role() {
  const addFormStore = useAddFormStore();

  const [value, setValue] = useState<string>(() => {
    const data = addFormStore.data;

    return data === null ? "" : data.role.value;
  });

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    addFormStore.updateData({
      role: {
        value: e.target.value as IRole,
        isValid: true,
      },
    });
  };

  return (
    <RoleInput
      additionalClasses=""
      errorMessage=""
      handleChange={handleChange}
      value={value}
    />
  );
}

export default Role;
