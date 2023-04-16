import clsx from "clsx";

import { CloseIcon } from "components/Icons";

import styles from "./CancelButton.module.css";

const CancelButton = ({ close, showCancelBtn }) => {
  return (
    <div
      className={clsx(styles["cancel-btn-ctn"], {
        [styles["showed-up"]]: showCancelBtn,
      })}
    >
      <button className={styles["cancel-btn"]} onClick={close}>
        <span>
          <CloseIcon w={12} h={12} />
        </span>
      </button>
    </div>
  );
};

export default CancelButton;
