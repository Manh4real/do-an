import React, { useState } from "react";

// import { MAXIMUM_QUANTITY } from "../../constants";

const BagSelect = ({ product, label, value: val, options, handleChange }) => {
  const [value, setValue] = useState(val);

  // useEffect(() => {
  //   setValue(val);
  // }, [val]);

  const handleSelect = (e) => {
    let v = e.target.value;

    if (label === "quantity") {
      v = +v;

      const availableQty =
        product.stock[product.added.colorId]?.find(
          (stock) => stock.size_id === product.added.size.size_id
        )?.quantity || 0;

      if (v > availableQty) {
        alert(`Exceeded required quantity!\n(Max: ${availableQty})`);
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
