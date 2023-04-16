import React, { useState } from "react";
import clsx from "clsx";

const PromoInputTag = ({ show }) => {
  const [value, setValue] = useState("");

  const handleChange = (e) => {
    setValue(e.target.value);
  };

  return (
    <div
      className={clsx("bag__promote-code-input", " flex-start", "w-100", {
        showed: show,
      })}
    >
      <input value={value} onChange={handleChange} />
      <button disabled={value === ""}>Apply</button>
    </div>
  );
};

export default PromoInputTag;
