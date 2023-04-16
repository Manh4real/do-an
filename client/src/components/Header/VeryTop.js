import React from "react";
import clsx from "clsx";

import TopLinks from "./TopLinks";
import { ConverseIcon, JDIcon } from "../Icons";

import styles from "./VeryTop.module.css";

const VeryTop = () => {
  return (
    <div className="header">
      <div className={styles["vr-top"]}>
        <div className={clsx(styles["vr-top-container"], "flex-spbw")}>
          <div className="flex-start gap-15">
            <a href="/" className="hover-w-fade">
              <JDIcon />
            </a>
            <a href="/" className="hover-w-fade">
              <ConverseIcon />
            </a>
          </div>

          <TopLinks />
        </div>
      </div>
    </div>
  );
};

export default VeryTop;
