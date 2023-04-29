import React, { useState } from "react";

import { EditIcon } from "../../../Icons";

// types
import { IUser } from "../../../types";
import Form from "./Form";
import Modal from "../../../components/Modal";

interface Props {
  user: IUser;
}

function EditButton({ user }: Props) {
  const [visible, setVisible] = useState(false);

  const handleOpen = () => {
    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);
  };

  return (
    <>
      <button
        onClick={handleOpen}
        className="text-gray-500 transition-colors duration-200 hover:text-yellow-500 focus:outline-none"
      >
        <EditIcon />
      </button>
      {visible && (
        <Modal>
          <Form user={user} handleClose={handleClose} />
        </Modal>
      )}
    </>
  );
}

export default EditButton;
