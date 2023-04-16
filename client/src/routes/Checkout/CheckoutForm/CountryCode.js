import React, { useImperativeHandle, useMemo, useState } from "react";
import countriesList from "countries-list";

import Select from "./Select";
import StyledCheckoutForm from "./StyledCheckoutForm";
import { useUserCountry } from "hooks";

const CountryCode = React.forwardRef((_, ref) => {
  const { countryCode } = useUserCountry();
  const [selected, setSelected] = useState(null);

  const handleChange = (option) => {
    setSelected(option);
  };

  const initialSelected = {
    value: countryCode,
    displayText: "+" + countriesList.countries[countryCode]?.phone,
  };

  useImperativeHandle(ref, () => ({
    getValue() {
      return selected || initialSelected;
    },
  }));

  const countryOptions = useMemo(
    () =>
      Object.entries(countriesList.countries).map(
        ([countryCode, { phone, native, emoji }]) => {
          return {
            value: countryCode,
            text: `${emoji} ${native}`,
            displayText: `+${phone}`,
          };
        }
      ),
    []
  );

  return (
    <StyledCheckoutForm>
      <Select
        selected={selected || initialSelected}
        options={countryOptions}
        handleChange={handleChange}
        optionsContainerWidth={"250px"}
      />
    </StyledCheckoutForm>
  );
});

export default CountryCode;
