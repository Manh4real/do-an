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
import { Link } from "react-router-dom";

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
            <Link to="/" className="bold-font regular-font">
              GIFT CARDS
            </Link>
          </li>
          <li>
            <Link to="/" className="bold-font regular-font">
              PROMOTIONS
            </Link>
          </li>
          <li>
            <Link to="/" className="bold-font regular-font">
              FIND A STORE
            </Link>
          </li>
          <li>
            <Link to="/" className="bold-font regular-font">
              SIGN UP FOR EMAIL
            </Link>
          </li>
          <li>
            <Link to="/" className="bold-font regular-font">
              BECOME A MEMBER
            </Link>
          </li>
          <li>
            <Link to="/" className="bold-font regular-font">
              4TW JOURNAL
            </Link>
          </li>
          <li>
            <Link to="/" className="bold-font regular-font">
              SEND US FEEDBACK
            </Link>
          </li>
        </ul>
      </div>
      <div className="col-2">
        <Expandable isMobile={isMobile} title="GET HELP">
          {(expanded) => {
            return (
              <ul className={clsx("expand", { active: expanded })}>
                <li>
                  <Link to="/">Order Status</Link>
                </li>
                <li>
                  <Link to="/">Shipping and Delivery</Link>
                </li>
                <li>
                  <Link to="/">Returns</Link>
                </li>
                <li>
                  <Link to="/">Payment Options</Link>
                </li>
                <li>
                  <Link to="/">Gift Card Balance</Link>
                </li>
                <li>
                  <Link to="/">Contact Us</Link>
                </li>
              </ul>
            );
          }}
        </Expandable>
      </div>
      <div className="col-3">
        <Expandable isMobile={isMobile} title="ABOUT 4TW">
          {(expanded) => {
            return (
              <ul className={clsx("expand", { active: expanded })}>
                <li>
                  <Link to="/">News</Link>
                </li>
                <li>
                  <Link to="/">Careers</Link>
                </li>
                <li>
                  <Link to="/">Investors</Link>
                </li>
                <li>
                  <Link to="/">Purpose</Link>
                </li>
                <li>
                  <Link to="/">Sustainability</Link>
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
            <a
              target="_blank"
              rel="noreferrer"
              href="https://twitter.com/manh_haui"
              className="social"
            >
              <TwitterIcon />
            </a>
          </li>
          <li>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://www.facebook.com/manh4L"
              className="social"
            >
              <FacebookIcon />
            </a>
          </li>
          <li>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://www.youtube.com/channel/UCdLNDo7Ml-A2_qUehzeOyAQ"
              className="social"
            >
              <YoutubeIcon />
            </a>
          </li>
          <li>
            <a
              target="_blank"
              rel="noreferrer"
              href="https://www.instagram.com/iamnvmanh"
              className="social"
            >
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
      <Link to="/" className="col-title bold-font" onClick={handleClick}>
        {title}
        {isMobile && expanded && <Minus />}
        {isMobile && !expanded && <Plus />}
      </Link>
      {children(expanded)}
    </div>
  );
};

export default Footer;
