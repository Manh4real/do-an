import clsx from "clsx";
import React, { useState } from "react";

function FirstNameInput({ initialValue, validateFirstName, setIsAllValid }) {
  const [value, setValue] = useState(initialValue);

  const handleChange = (e) => {
    setValue(e.target.value);

    validateFirstName(e.target.value);
    setIsAllValid();
  };

  const isValid = validateFirstName(value);

  return (
    <React.Fragment>
      <input
        type="text"
        id="firstName"
        name="firstName"
        value={value}
        onChange={handleChange}
        className={clsx({
          "is--error": validateFirstName(value),
        })}
      />
      <div className="error-message">{isValid}</div>
    </React.Fragment>
  );
}

export default FirstNameInput;
