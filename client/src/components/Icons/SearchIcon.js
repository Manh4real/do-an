import React from "react";

function SearchIcon({ h = "24", w = "24", fill = "#111" }) {
  return (
    <svg fill={fill} height={h} width={w} viewBox="0 0 24 24">
      <path d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0 1 1 0 0 0 0-1.39zM11 18a7 7 0 1 1 7-7 7 7 0 0 1-7 7z"></path>
    </svg>
  );
}

export default SearchIcon;
