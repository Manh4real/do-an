import React from "react";

function CheckIcon({ w = 24, h = 24, fill = "#111", className }) {
  return (
    <svg
      className={className}
      xmlns="http://www.w3.org/2000/svg"
      width={w}
      height={h}
      fill={fill}
      viewBox="0 0 24 24"
    >
      <path d="M20.285 2l-11.285 11.567-5.286-5.011-3.714 3.716 9 8.728 15-15.285z" />
    </svg>
  );
}

export default CheckIcon;
