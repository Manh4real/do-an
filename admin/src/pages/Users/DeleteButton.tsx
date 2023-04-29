import React, { useState } from "react";

import Modal from "../../components/Modal";
import { TrashBinIcon, WarningIcon } from "../../Icons";
import { deleteUser } from "../../services/users";
import { useRefreshContext } from "../../context";

interface Props {
  userId: string;
}
function DeleteButton({ userId }: Props) {
  const [visible, setVisible] = useState(false);
  const refreshContext = useRefreshContext();

  const handleOpen = () => {
    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);
  };

  const handleDelete = () => {
    if (userId)
      deleteUser(userId)
        .then((ok) => {
          if (ok) {
            handleClose();
            refreshContext.handleRefresh();
          }
        })
        .catch(() => {
          alert("Delete User Error: Something went wrong!");
        });
  };

  return (
    <>
      <button
        onClick={handleOpen}
        className="text-gray-500 transition-colors duration-200 hover:text-red-500 focus:outline-none"
      >
        <TrashBinIcon />
      </button>
      {visible && (
        <Modal>
          <p className="flex gap-2 mx-auto w-max text-amber-300">
            <WarningIcon />
            <span className="text-black font-medium">Warning</span>
          </p>
          <p className="text-lg font-medium text-center my-3">
            Are you sure to delete this record? <br />
            <small className="font-normal italic"></small>
          </p>
          <div className="flex gap-4 mt-8 py-3 justify-center">
            <button
              onClick={handleDelete}
              className="w-28 rounded-md bg-gray-100 px-3.5 py-2.5 text-sm font-semibold text-black shadow-sm hover:bg-gray-200 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-gray-600"
            >
              Yes, I'm sure
            </button>
            <button
              onClick={handleClose}
              className="w-28 rounded-md bg-indigo-600 px-3.5 py-2.5 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
            >
              Cancel
            </button>
          </div>
        </Modal>
      )}
    </>
  );
}

export default DeleteButton;
