import React from "react";
import clsx from "clsx";

import "./ArrowIcon.css";

function ArrowIcon({ toggle, type = "down", w = 12, h = 12 }) {
  switch (type) {
    case "down":
      return (
        <div
          className={clsx("arrow-down-icon", {
            toggle: toggle,
          })}
          aria-hidden="true"
        ></div>
      );
    case "up":
      return "";
    case "left":
      return (
        <svg
          className="arrow-icon"
          xmlns="http://www.w3.org/2000/svg"
          width={w}
          height={h}
          viewBox="0 0 24 24"
        >
          <path d="M16.67 0l2.83 2.829-9.339 9.175 9.339 9.167-2.83 2.829-12.17-11.996z" />
        </svg>
      );
    case "right":
      return (
        <svg
          xmlns="http://www.w3.org/2000/svg"
          width={w}
          height={h}
          viewBox="0 0 24 24"
        >
          <path d="M5 3l3.057-3 11.943 12-11.943 12-3.057-3 9-9z" />
        </svg>
      );

    default:
      throw new Error("Invalid type arrow icon...");
  }
}

export default ArrowIcon;
