import clsx from "clsx";
import React, { useState } from "react";

function LastNameInput({ initialValue, validateLastName, setIsAllValid }) {
  const [value, setValue] = useState(initialValue);

  const handleChange = (e) => {
    setValue(e.target.value);

    validateLastName(e.target.value);
    setIsAllValid();
  };

  const isValid = validateLastName(value);

  return (
    <React.Fragment>
      <input
        type="text"
        id="lastName"
        name="lastName"
        value={value}
        onChange={handleChange}
        className={clsx({
          "is--error": validateLastName(value),
        })}
      />

      <div className="error-message">{isValid}</div>
    </React.Fragment>
  );
}

export default LastNameInput;
