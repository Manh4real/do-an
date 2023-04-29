import React, { useState } from "react";
import countryList from "countries-list";

import { useEditFormStore } from "../../../store/editForm";
import CountryInput from "../_components/CountryInput";

function Country() {
  const editFormStore = useEditFormStore();

  const [value, setValue] = useState<string>(() => {
    const data = editFormStore.data;

    return data === null ? "" : data.country.value;
  });

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    editFormStore.updateData({
      country: {
        value: e.target.value as keyof typeof countryList.countries,
        isValid: true,
      },
    });
  };

  return (
    <CountryInput
      additionalClasses=""
      errorMessage=""
      handleChange={handleChange}
      value={value}
    />
  );
}

export default Country;
