import React, { useEffect, useState } from "react";
import clsx from "clsx";

import Option from "./Option";
import { ArrowIcon } from "components/Icons";

const Select = ({
  optionsContainerWidth,
  selected,
  options,
  children,
  onChange,
  handleChange: _handleChange = () => {},
  className,
  placeholder,
  ...props
}) => {
  const [showOptions, setShowOptions] = useState(false);

  const handleChange = (value) => {
    // setOption(value);
    setShowOptions(false);

    _handleChange(value);
  };
  const handleClick = (e) => {
    e.stopPropagation();

    setShowOptions(true);
  };
  const handleKeyDown = (e) => {
    e.stopPropagation();

    if (e.key === "Enter") {
      e.preventDefault();

      setShowOptions(true);
    }
  };

  //   const optionsContainerRef = useRef(null);
  const optionsContainerStyles = {
    position: "absolute",
    left: -2,
    right: -2,
    bottom: -10,
    width: optionsContainerWidth || "100%",
    translate: "0 100%",
    zIndex: 2,
    background: "#fff",
    border: "1px solid #eee",
    boxShadow: "0 5px 30px #00000020",
    maxHeight: 200,
    overflow: "auto",
    paddingBlock: 10,
  };

  useEffect(() => {
    const handleClickOutside = () => {
      setShowOptions(false);
    };

    window.addEventListener("click", handleClickOutside);

    return () => {
      window.removeEventListener("click", handleClickOutside);
    };
  }, []);

  return (
    <div
      className={clsx(className, "select", "flex-spbw")}
      {...props}
      tabIndex={0}
      onClick={handleClick}
      onKeyDown={handleKeyDown}
      style={{ position: "relative" }}
    >
      {selected?.displayText || selected?.text}
      <ArrowIcon type="down" />
      {/* {showOptions && children(value, handleChange)} */}
      {showOptions && (
        <div style={optionsContainerStyles}>
          {options.map((opt, i) => {
            return (
              <Option
                key={i}
                selected={opt.value === selected.value}
                option={opt}
                handleChange={handleChange}
              />
            );
          })}
        </div>
      )}
    </div>
  );
};

export default Select;
