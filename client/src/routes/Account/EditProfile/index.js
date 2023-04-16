import React, { useState } from "react";

import { PenIcon } from "components/Icons";
import { ModalContainer } from "components/ModalContainer";
import EditProfileForm from "./EditProfileForm";

function EditProfile() {
  const [visible, setVisible] = useState(false);

  const handleOpen = () => {
    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);
  };

  return (
    <React.Fragment>
      <button className="btn medium-button" onClick={handleOpen}>
        <PenIcon />
      </button>
      {visible && (
        <ModalContainer handleClose={handleClose}>
          <EditProfileForm handleClose={handleClose} />
        </ModalContainer>
      )}
    </React.Fragment>
  );
}

export default EditProfile;
