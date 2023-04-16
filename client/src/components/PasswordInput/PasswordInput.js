import React, { useState } from "react";

function PasswordInput({ first, initialValue, validatePassword }) {
  const [input, setInput] = useState(initialValue || "");

  const handleChange = (e) => {
    setInput(e.target.value);
  };

  return (
    <div className="input-ctn">
      <input
        value={input}
        onChange={handleChange}
        type="password"
        placeholder="Password"
        id="password"
        spellCheck={false}
      />
      {(!first || input) && validatePassword && validatePassword(input)}
    </div>
  );
}

export default PasswordInput;
