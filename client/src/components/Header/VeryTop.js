import React from "react";
import clsx from "clsx";

import TopLinks from "./TopLinks";
import { ConverseIcon, JDIcon } from "../Icons";

import styles from "./VeryTop.module.css";
import { Link } from "react-router-dom";

const VeryTop = () => {
  return (
    <div className="header">
      <div className={styles["vr-top"]}>
        <div className={clsx(styles["vr-top-container"], "flex-spbw")}>
          <div className="flex-start gap-15">
            <Link to="/" className="hover-w-fade">
              <JDIcon />
            </Link>
            <Link to="/" className="hover-w-fade">
              <ConverseIcon />
            </Link>
          </div>

          <TopLinks />
        </div>
      </div>
    </div>
  );
};

export default VeryTop;
