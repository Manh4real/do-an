import React, { useMemo, useRef, useState } from "react";
import clsx from "clsx";

import { CheckIcon } from "components/Icons";

function CheckoutFormInput({
  prefixElement,
  className,
  placeholder,
  htmlPlaceholder,
  validate,
  children,
  inputmode = "text",
}) {
  const [value, setValue] = useState("");
  const [first, setFirst] = useState(true);

  const Prefix = prefixElement;
  const prefixRef = useRef(null);

  const handleChange = (e) => {
    setValue(e.target.value);
    setFirst(false);
  };

  const c = useMemo(() => {
    let validateValue = value;

    if (prefixRef.current) {
      const prefix = prefixRef.current.getValue?.();

      validateValue = (prefix?.displayText || prefix?.text || "") + value;
    }

    return !first && validate(validateValue);
  }, [first, validate, value]);

  return (
    <div
      className={clsx(
        "checkout__form-input",
        "flex-start",
        "checkout__block",
        className,
        {
          "is--error": Boolean(c),
          "is--filled": Boolean(value),
          "is--valid": !first && !Boolean(c),
          "has--prefix": !!prefixElement,
        }
      )}
    >
      {prefixElement && <Prefix ref={prefixRef} />}
      <input
        value={value}
        onChange={handleChange}
        placeholder={htmlPlaceholder}
        inputMode={inputmode}
      />
      {!htmlPlaceholder && (
        <React.Fragment>
          <label className={clsx("flex-start", "gap-5", "regular-font")}>
            {placeholder || children}
          </label>
          <CheckIcon className="check-icon" w="12" h="12" fill="#6bd079" />
        </React.Fragment>
      )}
      <div className="mask"></div>
      {c}
    </div>
  );
}

export default CheckoutFormInput;
