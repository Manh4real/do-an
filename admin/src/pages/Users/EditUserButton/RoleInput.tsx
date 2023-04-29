import React, { useState } from "react";

import { useEditFormStore } from "../../../store/editForm";
import { IRole } from "../../../types";
import RoleInput from "../_components/RoleInput";

function Role() {
  const editFormStore = useEditFormStore();

  const [value, setValue] = useState<string>(() => {
    const data = editFormStore.data;

    return data === null ? "" : data.role.value;
  });

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    editFormStore.updateData({
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
