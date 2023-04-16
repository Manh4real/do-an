import React, { useState } from "react";

function Input({ callback, ...props }) {
  const [value, setValue] = useState("");

  const handleChange = (e) => {
    callback(e);
    setValue(e.target.value);
  };

  return <input value={value} onChange={handleChange} {...props} />;
}

export default Input;
