import React, { useState } from "react";

import { MAXIMUM_QUANTITY } from "../../constants";

const BagSelect = ({ label, value: val, options, handleChange }) => {
  const [value, setValue] = useState(val);

  // useEffect(() => {
  //   setValue(val);
  // }, [val]);

  const handleSelect = (e) => {
    let v = e.target.value;

    if (label === "quantity") {
      v = +v;

      if (v > MAXIMUM_QUANTITY) {
        alert("Exceeded required quantity!\n(Max: 5)");
        return;
      }
    }

    setValue(v);
    handleChange(v, label);
  };

  return (
    <div className="bag__select">
      <label htmlFor={label + "-input"}>{label}: </label>
      <select value={value} onChange={handleSelect} id={label + "-input"}>
        {options.map((v) => (
          <option key={v} value={v}>
            {v}
          </option>
        ))}
      </select>
    </div>
  );
};

export default BagSelect;
