import clsx from "clsx";
import React, { useState } from "react";

function EmailInput({ initialValue, validateEmail, setIsAllValid }) {
  const [value, setValue] = useState(initialValue);

  const handleChange = (e) => {
    setValue(e.target.value);

    validateEmail(e.target.value);
    setIsAllValid();
  };

  const isValid = validateEmail(value);

  return (
    <>
      <input
        type="text"
        id="email"
        name="email"
        value={value}
        onChange={handleChange}
        className={clsx({
          "is--error": !!isValid,
        })}
      />
      <div className="error-message">{isValid}</div>
    </>
  );
}

export default EmailInput;
