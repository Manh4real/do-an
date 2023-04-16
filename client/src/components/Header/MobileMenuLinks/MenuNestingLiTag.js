import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import clsx from "clsx";

import { ArrowIcon } from "components/Icons";
import { useToggleMobileMenuContext } from "../TopMenu";

const MenuNestingLiTag = ({
  className,
  fontSizeClass,
  prevIsAll,
  prev,
  name,
  priHref,
  children,
}) => {
  const { toggle } = useToggleMobileMenuContext();
  const [active, setActive] = useState(false);

  useEffect(() => {
    if (!toggle) handleBack();
  }, [toggle]);

  const handleClick = () => {
    setActive(true);
  };
  const handleBack = () => {
    setActive(false);
  };

  return (
    <li className={clsx("menu-title", className, { active: active })}>
      <button
        onClick={handleClick}
        className={clsx("hover-w-fade", "flex-spbw", fontSizeClass)}
      >
        {name}
        <ArrowIcon type="right" />
      </button>
      <SubMenu
        prev={prevIsAll ? "all" : prev}
        handleBack={handleBack}
        href={priHref}
        title={name}
      >
        {children}
      </SubMenu>
    </li>
  );
};
MenuNestingLiTag.propTypes = {
  className: PropTypes.string,
  fontSizeClass: PropTypes.string,
  prevIsAll: PropTypes.bool,
  priHref: PropTypes.string.isRequired,
};
MenuNestingLiTag.defaultProps = {
  className: "",
  fontSizeClass: "regular-font",
  prevIsAll: false,
  priHref: "/",
};

const SubMenu = ({ title, prev, href, handleBack, children }) => {
  return (
    <div className={clsx("sub-menu")}>
      <header>
        <button onClick={handleBack}>
          <ArrowIcon type="left" w="12" h="12" />
          <span className="small-font">{prev}</span>
        </button>
        <a href={href} className="bold-font medium-font">
          {title}
        </a>
      </header>
      {children}
    </div>
  );
};
export default MenuNestingLiTag;
