import React from "react";

function Minus({ w = 24, h = 24 }) {
  return (
    <svg
      className="minus-icon"
      xmlns="http://www.w3.org/2000/svg"
      width={w}
      height={h}
      viewBox="0 0 24 24"
    >
      <path d="M0 9h24v6h-24z" />
    </svg>
  );
}

export default Minus;
