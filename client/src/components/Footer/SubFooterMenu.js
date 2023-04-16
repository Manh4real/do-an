import { countryFromCountryCode } from "helpers";
import React, { useEffect, useState } from "react";
import { getUserGeolocation } from "services/location";
import GuidesNav from "./GuidesNav";

import "./SubFooterMenu.css";

function SubFooterMenu() {
  const [country, setCountry] = useState("");

  useEffect(() => {
    const controller = new AbortController();

    getUserGeolocation(null, { signal: controller.signal })
      .then((data) => {
        const countryName = countryFromCountryCode(data.geolocation.country);
        setCountry(countryName);
      })
      .catch((err) => {
        console.log(err);
      });

    return () => {
      controller.abort();
    };
  }, []);

  return (
    <React.Fragment>
      <div className="lc-cp grid-col-span-3 flex-start">
        <a href="/" className="location flex-center xsmall-font white-font">
          <svg height="15px" width="18px" fill="#fff" viewBox="0 0 42 58">
            <path d="M21 0C9.4 0 0 9.5 0 21.2 0 39.9 21 58 21 58s21-18.1 21-36.8C42 9.5 32.6 0 21 0zm0 31c-5.5 0-10-4.5-10-10s4.5-10 10-10 10 4.5 10 10-4.5 10-10 10z"></path>
          </svg>
          {country}
        </a>
        <span className="grey-font xsmall-font">
          © 2022 Nike, Inc. All Rights Reserved
        </span>
      </div>
      <div className="bottom-menu grid-col-span-2">
        <ul className="flex-end">
          <li tabIndex={0} className="footer__guides">
            <span className="xsmall-font">Guides</span>
            <GuidesNav />
          </li>
          <li>
            <a href="/" className="xsmall-font">
              Terms of Sale
            </a>
          </li>
          <li>
            <a href="/" className="xsmall-font">
              Terms of Use
            </a>
          </li>
          <li>
            <a href="/" className="xsmall-font">
              Nike Privacy Policy
            </a>
          </li>
          <li>
            <a href="/" className="xsmall-font">
              CA Supply Chains Act
            </a>
          </li>
        </ul>
      </div>
    </React.Fragment>
  );
}

export default SubFooterMenu;
