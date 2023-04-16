import React from "react";
import clsx from "clsx";
import { Link } from "react-router-dom";

import styles from "./CardDropdown.module.css";

const CardDropdown = ({ titleHref, title, children }) => {
  return (
    <div className={styles["card-dropdown"]}>
      <div className={clsx(styles["card-title"], "medium-font")}>
        <Link to={titleHref}>
          <h3>{title}</h3>
        </Link>
      </div>
      {children}
    </div>
  );
};
export default CardDropdown;
