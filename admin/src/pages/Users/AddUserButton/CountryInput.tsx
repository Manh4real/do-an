import React, { useState } from "react";
import countryList from "countries-list";

import { useAddFormStore } from "../../../store/addForm";
import CountryInput from "../_components/CountryInput";

function Country() {
  const addFormStore = useAddFormStore();

  const [value, setValue] = useState<string>(addFormStore.data.country.value);

  const handleChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setValue(e.target.value);

    addFormStore.updateData({
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
