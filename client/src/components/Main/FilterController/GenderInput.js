import React from "react";

const GenderInput = ({ handleClick, handleChange, id, gender, checked }) => {
  return (
    <div>
      <input
        type="radio"
        name="gender"
        id={id}
        checked={checked}
        onChange={handleChange}
      />
      <label htmlFor={id} onClick={() => handleClick({ gender })}>
        {gender}
      </label>
      <br />
    </div>
  );
};

export default GenderInput;
