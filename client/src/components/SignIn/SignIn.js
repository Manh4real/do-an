import React, { useContext } from "react";
import clsx from "clsx";

import { toModalRoot } from "../index";

import Form from "./Form";
import { CloseIcon, Logo } from "components/Icons";

import { ActiveFormContext } from "components/Header/TopLinks";
import { SIGN_UP } from "script";

import StyledSignIn from "./StyledSignIn";

const SignIn = ({ isShown, onClose, onReplace }) => {
  const { handleFormChange } = useContext(ActiveFormContext);

  const handleClick = (e) => {
    e.preventDefault();
    onReplace();
    handleFormChange(SIGN_UP);
  };

  return (
    <StyledSignIn
      id="si"
      className={clsx({ active: isShown })}
      onClick={() => {
        onClose();
      }}
    >
      <div className="sign-in-form" onClick={(e) => e.stopPropagation()}>
        <div>
          <Logo h="45" w="45" />
        </div>
        <div className="title sign-in-title">
          YOUR ACCOUNT FOR <br />
          EVERYTHING 4TW
        </div>
        <div className="container sign-in-content-ctn">
          <Form />
          <p className="grey-font small-font">
            Not a member?&nbsp;
            <a
              href="/"
              style={{ color: "#111" }}
              id="join-us"
              onClick={handleClick}
            >
              Join Us.
            </a>
          </p>
        </div>
        <button className="close-btn" onClick={onClose}>
          <CloseIcon />
        </button>
      </div>
    </StyledSignIn>
  );
};

export default toModalRoot(SignIn);
