import clsx from "clsx";
import { Eye, EyeSlash } from "components/Icons";
import React, { useState } from "react";

function PasswordInput({ initialValue, validatePassword, setIsAllValid }) {
  const [value, setValue] = useState(initialValue);
  const [visible, setVisible] = useState(false);

  const handleChange = (e) => {
    setValue(e.target.value);

    validatePassword(e.target.value);
    setIsAllValid();
  };

  const isValid = validatePassword(value);

  return (
    <>
      <input
        type={visible ? "text" : "password"}
        id="password"
        name="password"
        value={value}
        onChange={handleChange}
        className={clsx({
          "is--error": !!isValid,
        })}
      />
      <div
        onClick={() => {
          setVisible((prev) => !prev);
        }}
        style={{
          position: "absolute",
          right: 10,
          top: "50%",
          translate: "0 -50%",
          cursor: "pointer",
        }}
      >
        {visible ? <EyeSlash /> : <Eye />}
      </div>
      <div className="error-message">{isValid}</div>
    </>
  );
}

export default PasswordInput;
