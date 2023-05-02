import React, { useState } from "react";

function BagSelectSize({ label, value: val, options, handleChange }) {
  const [value, setValue] = useState(val);

  const handleSelect = (e) => {
    let v = e.target.value;
    setValue(v);
    handleChange(
      {
        size_id: v,
        size: options.find((opt) => opt.size_id === v).size,
      },
      label
    );
  };

  return (
    <div className="bag__select">
      <label htmlFor={label + "-input"}>{label}: </label>
      <select value={value} onChange={handleSelect} id={label + "-input"}>
        {options
          .sort((a, b) => (a.size_id > b.size_id ? 1 : -1))
          .map((v, i) => (
            <option key={i} value={v.size_id}>
              {v.size}
            </option>
          ))}
      </select>
    </div>
  );
}

export default BagSelectSize;
