import React from "react";
import clsx from "clsx";

import "./MobileMenuMask.css";

const MobileMenuMask = ({ active, handleToggle }) => {
  return (
    <div
      onClick={handleToggle}
      className={clsx("mobile-mask", { active: active })}
    ></div>
  );
};

export default MobileMenuMask;
