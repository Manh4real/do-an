import React, { useEffect } from "react";

import { toModalRoot } from "components";

import StyledModalContainer from "./StyledModalContainer";
import { CloseIcon } from "components/Icons";

function ModalContainer({ handleClose, children }) {
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (e.key === "Escape") {
        handleClose();
      }
    };

    window.addEventListener("keydown", handleKeyDown);

    return () => {
      window.removeEventListener("keydown", handleKeyDown);
    };
  }, [handleClose]);

  return (
    <StyledModalContainer>
      <div className="container">
        {children}
        <button type="button" className="close-btn" onClick={handleClose}>
          <CloseIcon />
        </button>
      </div>
    </StyledModalContainer>
  );
}

export default toModalRoot(ModalContainer);
