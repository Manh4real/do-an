import React from "react";

function CloseIcon({ w = 20, h = 20 }) {
  return (
    <svg
      className="close-icon"
      fill="#111"
      height={h}
      width={w}
      viewBox="0 0 24 24"
    >
      <path d="M15.04 12L24 2.96 21.04 0 12 8.96 3.04 0 0 2.96 9.04 12 0 20.96 3.04 24 12 14.96 21.04 24 24 20.96z"></path>
    </svg>
  );
}

export default CloseIcon;
