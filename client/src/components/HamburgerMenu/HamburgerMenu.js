import clsx from "clsx";
import React from "react";

import { CloseIcon, HamburgerIcon } from "../Icons";
import { useToggleMobileMenuContext } from "../Header/TopMenu";

import StyledHamburgerMenu from "./StyledHamburgerMenu";

function HamburgerMenu() {
  const { toggle, handleToggle } = useToggleMobileMenuContext();

  return (
    <StyledHamburgerMenu className={clsx({ toggle })} onClick={handleToggle}>
      {toggle ? <CloseIcon /> : <HamburgerIcon />}
    </StyledHamburgerMenu>
  );
}

export default HamburgerMenu;
