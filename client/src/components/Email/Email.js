import React, { useState } from "react";

function Email({ first, validateEmail }) {
  const [input, setInput] = useState("");

  const handleChange = (e) => {
    setInput(e.target.value);
  };
  return (
    <div className="input-ctn">
      <input
        value={input}
        onChange={handleChange}
        placeholder="Email address"
        spellCheck="false"
        id="email-input"
      />
      {(!first || input) && validateEmail && validateEmail(input)}
    </div>
  );
}

export default Email;
