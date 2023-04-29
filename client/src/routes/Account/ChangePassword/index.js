import { ModalContainer } from "components/ModalContainer";
import React, { useState } from "react";
import Form from "./Form";

function ChangePassword() {
  const [visible, setVisible] = useState(false);

  const handleOpen = () => {
    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);
  };

  return (
    <React.Fragment>
      <button
        className="btn cta medium-button regular-font"
        style={{
          marginTop: 22,
        }}
        onClick={handleOpen}
      >
        Change password
      </button>
      {visible && (
        <ModalContainer handleClose={handleClose}>
          <Form handleClose={handleClose} />
        </ModalContainer>
      )}
    </React.Fragment>
  );
}

export default ChangePassword;
