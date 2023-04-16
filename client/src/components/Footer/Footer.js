import React, { useEffect, useState } from "react";

import {
  FacebookIcon,
  InstagramIcon,
  Minus,
  Plus,
  TwitterIcon,
  YoutubeIcon,
} from "components/Icons";

import StyledFooter from "./StyledFooter";
import SubFooterMenu from "./SubFooterMenu";
import clsx from "clsx";

function Footer() {
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 450);

  useEffect(() => {
    const handleResize = () => {
      setIsMobile(window.innerWidth <= 450);
    };

    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);

  return (
    <StyledFooter>
      <div className="col-1">
        <ul>
          <li>
            <a href="/" className="bold-font regular-font">
              GIFT CARDS
            </a>
          </li>
          <li>
            <a href="/" className="bold-font regular-font">
              PROMOTIONS
            </a>
          </li>
          <li>
            <a href="/" className="bold-font regular-font">
              FIND A STORE
            </a>
          </li>
          <li>
            <a href="/" className="bold-font regular-font">
              SIGN UP FOR EMAIL
            </a>
          </li>
          <li>
            <a href="/" className="bold-font regular-font">
              BECOME A MEMBER
            </a>
          </li>
          <li>
            <a href="/" className="bold-font regular-font">
              NIKE JOURNAL
            </a>
          </li>
          <li>
            <a href="/" className="bold-font regular-font">
              SEND US FEEDBACK
            </a>
          </li>
        </ul>
      </div>
      <div className="col-2">
        <Expandable isMobile={isMobile} title="GET HELP">
          {(expanded) => {
            return (
              <ul className={clsx("expand", { active: expanded })}>
                <li>
                  <a href="/">Order Status</a>
                </li>
                <li>
                  <a href="/">Shipping and Delivery</a>
                </li>
                <li>
                  <a href="/">Returns</a>
                </li>
                <li>
                  <a href="/">Payment Options</a>
                </li>
                <li>
                  <a href="/">Gift Card Balance</a>
                </li>
                <li>
                  <a href="/">Contact Us</a>
                </li>
              </ul>
            );
          }}
        </Expandable>
      </div>
      <div className="col-3">
        <Expandable isMobile={isMobile} title="ABOUT NIKE">
          {(expanded) => {
            return (
              <ul className={clsx("expand", { active: expanded })}>
                <li>
                  <a href="/">News</a>
                </li>
                <li>
                  <a href="/">Careers</a>
                </li>
                <li>
                  <a href="/">Investors</a>
                </li>
                <li>
                  <a href="/">Purpose</a>
                </li>
                <li>
                  <a href="/">Sustainability</a>
                </li>
              </ul>
            );
          }}
        </Expandable>
      </div>
      <div className="col-4"></div>
      <div className="socials-col col-5">
        <ul className="social-links flex-end">
          <li>
            <a href="/" className="social">
              <TwitterIcon />
            </a>
          </li>
          <li>
            <a href="/" className="social">
              <FacebookIcon />
            </a>
          </li>
          <li>
            <a href="/" className="social">
              <YoutubeIcon />
            </a>
          </li>
          <li>
            <a href="/" className="social">
              <InstagramIcon />
            </a>
          </li>
        </ul>
      </div>
      <SubFooterMenu />
    </StyledFooter>
  );
}

const Expandable = ({ isMobile, title, children }) => {
  const [expanded, setExpanded] = useState(false);

  const handleClick = (e) => {
    if (!isMobile) return;

    e.preventDefault();
    setExpanded((prev) => !prev);
  };

  return (
    <div className="col-2">
      <a href="/" className="col-title bold-font" onClick={handleClick}>
        {title}
        {isMobile && expanded && <Minus />}
        {isMobile && !expanded && <Plus />}
      </a>
      {children(expanded)}
    </div>
  );
};

export default Footer;
