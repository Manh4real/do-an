import React from "react";

function LocationArrowIcon({ w = 24, h = 24, fill = "#111" }) {
  return (
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width={w}
      height={h}
      viewBox="0 0 24 24"
      fill={fill}
    >
      <path d="M20.585 3.417l-5.194 13.873-1.743-6.939-6.932-1.733 13.869-5.201zm3.415-3.417l-24 9 12 3 3.014 12 8.986-24z" />
    </svg>
  );
}

export default LocationArrowIcon;
