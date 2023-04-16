import React, { useState } from "react";

function NameInputs({ first, validateName }) {
  const [firstName, setFirstName] = useState("");
  const [lastName, setLastName] = useState("");

  return (
    <>
      <div className="input-ctn">
        <input
          value={firstName}
          onChange={(e) => setFirstName(e.target.value)}
          placeholder="First Name"
          spellCheck="false"
          id="firstName-input"
        />
        {(!first || firstName) &&
          validateName &&
          validateName(firstName, "firstName", "first name")}
      </div>
      <div className="input-ctn">
        <input
          value={lastName}
          onChange={(e) => setLastName(e.target.value)}
          placeholder="Last Name"
          spellCheck="false"
          id="lastName-input"
        />
        {(!first || lastName) &&
          validateName &&
          validateName(lastName, "lastName", "last name")}
      </div>
    </>
  );
}

export default NameInputs;
