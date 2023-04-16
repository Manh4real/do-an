import React from "react";
import clsx from "clsx";

import { toModalRoot } from "../..";
import StyledShownImageModal from "./StyledShownImageModal";

const ShownImageModal = ({ shown, src, handleClose, ...props }) => {
  return (
    <StyledShownImageModal
      {...props}
      className={clsx("fixed-image-modal", { shown })}
      onClick={handleClose}
    >
      <img src={src} alt="" onClick={(e) => e.stopPropagation()} />
      <div className="close-modal-btn">
        <button onClick={handleClose}>&times;</button>
      </div>
    </StyledShownImageModal>
  );
};

export default toModalRoot(ShownImageModal);
