import React, { useRef, useContext } from "react";

import { DropdownMenu } from "./DropdownMenu/";
import { DropdownContext } from "./MenuLinks";
import styles from "./MenuLink.module.css";

import clsx from "clsx";
import { Link } from "react-router-dom";

function MenuLink({ l }) {
  const { handleAddDropdown, active, toggle } = useContext(DropdownContext);
  const ddRef = useRef();

  const appearDropdown = () => {
    handleAddDropdown(ddRef.current.id);
  };

  return (
    <li className={styles["tpMnLkCtn"]}>
      <Link
        to={l.href}
        className={clsx(styles["top-menu-link"], {
          [styles.active]: active === ddRef.current?.id,
        })}
        onMouseEnter={toggle ? null : appearDropdown}
        onFocus={toggle ? null : appearDropdown}
      >
        {l.name}
      </Link>
      <DropdownMenu ref={ddRef} categories={l.categories} />
    </li>
  );
}

export default MenuLink;
