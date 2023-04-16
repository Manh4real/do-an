import React from "react";

function Plus({ w = 24, h = 24 }) {
  return (
    <svg
      className="plus-icon"
      xmlns="http://www.w3.org/2000/svg"
      width={w}
      height={h}
      viewBox="0 0 24 24"
    >
      <path d="M24 9h-9v-9h-6v9h-9v6h9v9h6v-9h9z" />
    </svg>
  );
}

export default Plus;
