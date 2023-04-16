import React from "react";

function ThinnerArrowIcon({ toggle, type = "down", w = 12, h = 12 }) {
  switch (type) {
    case "down":
      return <svg width={w} height={h} clipRule="evenodd" fillRule="evenodd" strokeLinejoin="round" strokeMiterlimit="2" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="m16.843 10.211c.108-.141.157-.3.157-.456 0-.389-.306-.755-.749-.755h-8.501c-.445 0-.75.367-.75.755 0 .157.05.316.159.457 1.203 1.554 3.252 4.199 4.258 5.498.142.184.36.29.592.29.23 0 .449-.107.591-.291zm-7.564.289h5.446l-2.718 3.522z" fillRule="nonzero"/></svg>;
    case "up":
      return "";
    case "left":
      return (
        <svg
          aria-hidden="true"
          focusable="false"
          viewBox="0 0 24 24"
          role="img"
          width="24px"
          height="24px"
          fill="none"
        >
          <path
            stroke="currentColor"
            strokeWidth="1.5"
            d="M15.526 18.966L8.559 12l6.967-6.967"
          ></path>
        </svg>
      );
    case "right":
      return (
        <svg
          aria-hidden="true"
          focusable="false"
          viewBox="0 0 24 24"
          role="img"
          width="24px"
          height="24px"
          fill="none"
        >
          <path
            stroke="currentColor"
            strokeWidth="1.5"
            d="M8.474 18.966L15.44 12 8.474 5.033"
          ></path>
        </svg>
      );

    default:
      throw new Error("Invalid type arrow icon...");
  }
}

export default ThinnerArrowIcon;
