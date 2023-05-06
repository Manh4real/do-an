import clsx from "clsx";
import React, { useEffect, useState } from "react";
import StyledBottomMenu from "./StyledBottomMenu";
import { Link } from "react-router-dom";

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
                    <Link to="/">Air Force 1 </Link>
                  </li>
                  <li>
                    <Link to="/">Jordan 1 </Link>
                  </li>
                  <li>
                    <Link to="/">Air Max 2090 </Link>
                  </li>
                  <div className="hidden">
                    <li>
                      <Link to="/">Air Max 270 </Link>
                    </li>
                    <li>
                      <Link to="/">Air Max 97 </Link>
                    </li>
                    <li>
                      <Link to="/">Air Max 90 </Link>
                    </li>
                    <li>
                      <Link to="/">Blazer </Link>
                    </li>
                    <li>
                      <Link to="/">React </Link>
                    </li>
                    <li>
                      <Link to="/">Pegasus </Link>
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
                    <Link to="/"> All Shoes</Link>
                  </li>
                  <li>
                    <Link to="/">Jordan Shoes</Link>
                  </li>
                  <li>
                    <Link to="/">Running Shoes</Link>
                  </li>
                  <div className="hidden">
                    <li>
                      <Link to="/">Basketball Shoes</Link>
                    </li>
                    <li>
                      <Link to="/">Tennis Shoes</Link>
                    </li>
                    <li>
                      <Link to="/">Training Shoes</Link>
                    </li>
                    <li>
                      <Link to="/">Custom Shoes</Link>
                    </li>
                    <li>
                      <Link to="/">Sale Shoes</Link>
                    </li>
                    <li>
                      <Link to="/">Soccer Cleats</Link>
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
                    <Link to="/">All Clothing </Link>
                  </li>
                  <li>
                    <Link to="/">Tops & T-Shirts </Link>
                  </li>
                  <li>
                    <Link to="/">Shorts </Link>
                  </li>
                  <div className="hidden">
                    <li>
                      <Link to="/">Hoodies & Pullovers </Link>
                    </li>
                    <li>
                      <Link to="/">Joggers & Sweatpants </Link>
                    </li>
                    <li>
                      <Link to="/">Sports Bras </Link>
                    </li>
                    <li>
                      <Link to="/">Pants & Tights </Link>
                    </li>
                    <li>
                      <Link to="/">Socks </Link>
                    </li>
                    <li>
                      <Link to="/">Yoga </Link>
                    </li>
                    <li>
                      <Link to="/">4TWLab </Link>
                    </li>
                    <li>
                      <Link to="/">Plus Size </Link>
                    </li>
                    <li>
                      <Link to="/">Big & Tall </Link>
                    </li>
                    <li>
                      <Link to="/">Luxe Leggings </Link>
                    </li>
                    <li>
                      <Link to="/">Sale Clothing </Link>
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
