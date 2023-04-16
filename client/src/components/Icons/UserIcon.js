import React from "react";

function UserIcon({ width = 24, height = 24 }) {
  return (
    <svg
      aria-hidden="true"
      focusable="false"
      viewBox="0 0 24 24"
      role="img"
      width={width}
      height={height}
      fill="none"
      data-var="glyph"
    >
      <path
        stroke="currentColor"
        strokeWidth="2"
        d="M3.75 21v-3a3.75 3.75 0 013.75-3.75h9A3.75 3.75 0 0120.25 18v3"
      ></path>
      <path
        stroke="currentColor"
        strokeWidth="2"
        d="M15.75 7.5a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z"
        clipRule="evenodd"
      ></path>
    </svg>
  );
}

export default UserIcon;
