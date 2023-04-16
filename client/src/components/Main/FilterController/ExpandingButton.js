import React from "react";

import styles from "./ExpandingButton.module.css";

function ExpandingButton({ activeExpand, onClick }) {
  return (
    <div className={styles["expanding-btn"]}>
      <button className="w-100 regular-font" onClick={onClick}>
        {activeExpand ? "- Less" : "+ More"}
      </button>
    </div>
  );
}

export default ExpandingButton;
