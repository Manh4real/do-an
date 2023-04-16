import React, { useState } from "react";

function BirthdayInput({ validateBirthday }) {
  const [input, setInput] = useState(() => {
    const today = new Date();
    const year = today.getFullYear();
    const month = padStart(today.getMonth() + 1);
    const day = padStart(today.getDate());

    const date = `${year}-${month}-${day}`;
    return date;
  });

  const handleChange = (e) => {
    setInput(e.target.value);
  };

  return (
    <React.Fragment>
      <div className="input-ctn">
        <input
          value={input}
          onChange={handleChange}
          type="date"
          placeholder="Date Of Birth"
          spellCheck="false"
          id="date-input"
        />
        {validateBirthday && validateBirthday(input)}
      </div>
      <p>Get a Nike Member Reward every year on your Birthday.</p>
    </React.Fragment>
  );
}
const padStart = (number) => {
  return number >= 10 ? number : `0${number}`;
};

export default BirthdayInput;
