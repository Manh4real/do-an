import React, { useState } from "react";

import { ModalContainer } from "components/ModalContainer";
import Form from "./Form";

import { useIsLoggedIn } from "features/user/userSlice";
import useRedirect from "hooks/useRedirect";

const WriteReview = ({ productId }) => {
  const [visible, setVisible] = useState(false);

  const redirect = useRedirect();
  const isLoggedIn = useIsLoggedIn();

  const handleOpen = () => {
    if (!isLoggedIn) {
      const answer = window.confirm("You need to log in first.");

      if (answer) {
        redirect({ to: "/sign-in" });
      }

      return;
    }

    setVisible(true);
  };
  const handleClose = () => {
    setVisible(false);
  };

  return (
    <React.Fragment>
      <span
        className="inline-block underlined hover-w-fade regular-font fw-medium mb-30"
        onClick={handleOpen}
      >
        Write a review
      </span>
      {visible && (
        <ModalContainer handleClose={handleClose}>
          <Form productId={productId} />
        </ModalContainer>
      )}
    </React.Fragment>
  );
};

export default WriteReview;
