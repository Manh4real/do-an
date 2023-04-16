import clsx from "clsx";
import React, { useEffect, useState } from "react";

function CheckoutFormRadios({ els, name, validate }) {
  const [active, setActive] = useState(els[0].id);

  const handleChange = (e) => {
    setActive(e.target.id);
  };
  useEffect(() => {
    validate(active, name);
  }, [active, name, validate]);

  return els.map((el) => {
    return (
      <div key={el.id} className="flex-start gap-3 row">
        <input
          type="radio"
          checked={active === el.id}
          onChange={handleChange}
          id={el.id}
          name={name}
        />
        <div
          id={el.id}
          htmlFor={el.id}
          aria-labelledby="custom-radio"
          data-checked={active === el.id}
          tabIndex="1"
          onClick={handleChange}
          className={clsx("custom-radio", {
            checked: active === el.id,
          })}
        ></div>
        <label htmlFor={el.id}>{el.label}</label>
      </div>
    );
  });
}

export default CheckoutFormRadios;
