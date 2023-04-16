import clsx from "clsx";
import React, { useEffect, useState } from "react";
import StyledBottomMenu from "./StyledBottomMenu";

function BottomMenu() {
  const [isMobile, setIsMobile] = useState(window.innerWidth < 650);

  useEffect(() => {
    const handleResize = () => {
      setIsMobile(window.innerWidth < 650);
    };

    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  return (
    <StyledBottomMenu>
      <div className="ddbt-container">
        <div className="drop-down-menu drop-down-bottom" aria-expanded="true">
          <Expandable isMobile={isMobile} title="Featured">
            {(expanded) => {
              return (
                <ul
                  className={clsx({
                    "onMobile--expanded": expanded,
                  })}
                >
                  <li>
                    <a href="/">Air Force 1 </a>
                  </li>
                  <li>
                    <a href="/">Jordan 1 </a>
                  </li>
                  <li>
                    <a href="/">Air Max 2090 </a>
                  </li>
                  <div className="hidden">
                    <li>
                      <a href="/">Air Max 270 </a>
                    </li>
                    <li>
                      <a href="/">Air Max 97 </a>
                    </li>
                    <li>
                      <a href="/">Air Max 90 </a>
                    </li>
                    <li>
                      <a href="/">Blazer </a>
                    </li>
                    <li>
                      <a href="/">React </a>
                    </li>
                    <li>
                      <a href="/">Pegasus </a>
                    </li>
                  </div>
                </ul>
              );
            }}
          </Expandable>

          <Expandable isMobile={isMobile} title="Shoes">
            {(expanded) => {
              return (
                <ul
                  className={clsx({
                    "onMobile--expanded": expanded,
                  })}
                >
                  <li>
                    <a href="/"> All Shoes</a>
                  </li>
                  <li>
                    <a href="/">Jordan Shoes</a>
                  </li>
                  <li>
                    <a href="/">Running Shoes</a>
                  </li>
                  <div className="hidden">
                    <li>
                      <a href="/">Basketball Shoes</a>
                    </li>
                    <li>
                      <a href="/">Tennis Shoes</a>
                    </li>
                    <li>
                      <a href="/">Training Shoes</a>
                    </li>
                    <li>
                      <a href="/">Custom Shoes</a>
                    </li>
                    <li>
                      <a href="/">Sale Shoes</a>
                    </li>
                    <li>
                      <a href="/">Soccer Cleats</a>
                    </li>
                  </div>
                </ul>
              );
            }}
          </Expandable>

          <Expandable isMobile={isMobile} title="Clothing">
            {(expanded) => {
              return (
                <ul
                  className={clsx({
                    "onMobile--expanded": expanded,
                  })}
                >
                  <li>
                    <a href="/">All Clothing </a>
                  </li>
                  <li>
                    <a href="/">Tops & T-Shirts </a>
                  </li>
                  <li>
                    <a href="/">Shorts </a>
                  </li>
                  <div className="hidden">
                    <li>
                      <a href="/">Hoodies & Pullovers </a>
                    </li>
                    <li>
                      <a href="/">Joggers & Sweatpants </a>
                    </li>
                    <li>
                      <a href="/">Sports Bras </a>
                    </li>
                    <li>
                      <a href="/">Pants & Tights </a>
                    </li>
                    <li>
                      <a href="/">Socks </a>
                    </li>
                    <li>
                      <a href="/">Yoga </a>
                    </li>
                    <li>
                      <a href="/">NikeLab </a>
                    </li>
                    <li>
                      <a href="/">Plus Size </a>
                    </li>
                    <li>
                      <a href="/">Big & Tall </a>
                    </li>
                    <li>
                      <a href="/">Luxe Leggings </a>
                    </li>
                    <li>
                      <a href="/">Sale Clothing </a>
                    </li>
                  </div>
                </ul>
              );
            }}
          </Expandable>
        </div>
      </div>
    </StyledBottomMenu>
  );
}

const Expandable = ({ isMobile, title, children }) => {
  const [expanded, setExpanded] = useState(false);

  // console.log(isMobile);
  const handleClick = () => {
    // console.log("??");
    if (!isMobile) return;
    setExpanded((prev) => !prev);
  };

  return (
    <div>
      <h3 onClick={handleClick}>{title}</h3>
      {children(expanded)}
    </div>
  );
};

export default BottomMenu;
