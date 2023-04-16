import React, { useContext, useEffect, useState } from "react";

import MenuLinks from "./MenuLinks";
import MobileMenuLinks from "./MobileMenuLinks/MobileMenuLinks";
import HamburgerMenu from "../HamburgerMenu/HamburgerMenu";

import styles from "./TopMenu.module.css";

const ToggleMobileMenuContext = React.createContext({});
export const useToggleMobileMenuContext = () =>
  useContext(ToggleMobileMenuContext);

const TopMenu = () => {
  const [toggle, setToggle] = useState(false);
  const [isMobile, setIsMobile] = useState(window.innerWidth <= 960);

  const handleToggle = () => {
    setToggle((prev) => !prev);
  };

  useEffect(() => {
    document.querySelector("body").style.overflow = toggle
      ? "hidden"
      : "initial";
  }, [toggle]);

  useEffect(() => {
    const handleResize = () => {
      setIsMobile(window.innerWidth <= 960);
    };

    window.addEventListener("resize", handleResize);

    return () => window.removeEventListener("resize", handleResize);
  }, []);

  return (
    <div className={styles["top-menu-ctn"]}>
      <div className={styles["top-menu"]}>
        <ToggleMobileMenuContext.Provider value={{ toggle, handleToggle }}>
          <nav>{!isMobile ? <MenuLinks /> : <MobileMenuLinks />}</nav>
          <HamburgerMenu />
        </ToggleMobileMenuContext.Provider>
      </div>
    </div>
  );
};

export default TopMenu;
