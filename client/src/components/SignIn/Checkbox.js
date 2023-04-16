import React, { useState, useEffect } from "react";

function Checkbox({ checked, validateKeepSignIn }) {
  const [check, setCheck] = useState(checked);

  useEffect(() => {
    if (validateKeepSignIn) validateKeepSignIn(check);
  }, [validateKeepSignIn, check]);

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-between",
        paddingBottom: "25px",
      }}
    >
      <div className="kmsi-ctn">
        <input
          checked={check}
          onChange={() => setCheck((prev) => !prev)}
          type="checkbox"
          name=""
          id="keep-me-signed-in-checkbox"
        />
        <label htmlFor="keep-me-signed-in-checkbox" className="grey-font">
          Keep me signed in
        </label>
      </div>
      <div>
        <a href="/" className="grey-font fg-pw">
          Forgotten your password?
        </a>
      </div>
    </div>
  );
}

export default Checkbox;
