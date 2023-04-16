import React from "react";

function Star({
  width = 24,
  height = 24,
  count = 1,
  fill = "currentColor",
  onClick = () => {},
}) {
  return (
    <span style={{ display: "inline-flex" }}>
      {new Array(count).fill(0).map((_, i) => {
        return (
          <svg
            key={i}
            onClick={onClick}
            xmlns="http://www.w3.org/2000/svg"
            width={width}
            height={height}
            viewBox="0 0 24 24"
            style={{ marginLeft: 3 }}
            fill={fill}
          >
            <path d="M12 .288l2.833 8.718h9.167l-7.417 5.389 2.833 8.718-7.416-5.388-7.417 5.388 2.833-8.718-7.416-5.389h9.167z" />
          </svg>
        );
      })}
    </span>
  );
}

export default Star;
