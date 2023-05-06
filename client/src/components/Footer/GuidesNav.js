import React from "react";

import StyledGuidesNav from "./StyledGuidesNav";
import { Link } from "react-router-dom";

function GuidesNav() {
  return (
    <StyledGuidesNav className="footer__guides-nav">
      <ul>
        <li>
          <Link to="/" className="small-font">
            Adidas Adapt
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Nike Air
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Nike Air Force 1
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Nike Air Max
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Adidas FlyEase
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Adidas Flyknit
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Adidas Flyleather
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Free
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Nike Joyride
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Nike Pegasus
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Adidas React
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Adidas Vaporfly
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Nike Zoom Fly
          </Link>
        </li>
        <li>
          <Link to="/" className="small-font">
            Adidas ZoomX
          </Link>
        </li>
      </ul>
    </StyledGuidesNav>
  );
}

export default GuidesNav;
