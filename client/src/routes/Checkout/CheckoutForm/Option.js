import React from "react";
import clsx from "clsx";

const Option = ({
  handleChange,
  selected,
  option = { value: "", text: "" },
  className,
  children,
  ...props
}) => {
  const handleClick = (e) => {
    e.preventDefault();
    e.stopPropagation();

    handleChange(option);
  };
  const handleKeyDown = (e) => {
    e.stopPropagation();

    if (e.key === "Enter") {
      e.preventDefault();
      handleChange(option);
    }
  };

  return (
    <div
      id={"option-" + option.value}
      tabIndex={0}
      className={clsx(className, "option", {
        selected: selected,
      })}
      {...props}
      onClick={handleClick}
      onKeyDown={handleKeyDown}
    >
      {option.text || option.value}
    </div>
  );
};

export default Option;
