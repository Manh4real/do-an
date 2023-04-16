import React, { useState, useEffect } from "react";

function Checkbox({ checked, validateCheckbox }) {
  const [check, setCheck] = useState(checked);

  useEffect(() => {
    if (validateCheckbox) validateCheckbox(check);
  }, [validateCheckbox, check]);

  const handleChange = () => {
    setCheck((prev) => !prev);
  };

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "space-between",
        paddingBottom: 25,
      }}
    >
      <div className="kmsi-ctn">
        <input
          checked={check}
          onChange={handleChange}
          type="checkbox"
          name=""
          id="keep-me-signed-in-checkbox"
        />
        <label htmlFor="keep-me-signed-in-checkbox">
          Sign up for emails to get updates from Nike on products, offers, and
          your Member benefits
        </label>
      </div>
    </div>
  );
}

export default Checkbox;
