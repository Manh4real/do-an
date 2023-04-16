import React from "react";
import { toModalRoot } from "../index";

import { withEvent } from "./withEvent";

import styles from "./Mask.module.css";
import clsx from "clsx";

function Mask({ isShown, onClick }, ref) {
  return (
    <div
      ref={ref}
      className={clsx(styles.mask, { [styles.active]: isShown })}
      onClick={onClick}
    />
  );
}

export const RootMask = toModalRoot(React.forwardRef(Mask));

export default withEvent(RootMask);
