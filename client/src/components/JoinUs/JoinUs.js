import React, { useContext } from "react";
import clsx from "clsx";

import { toModalRoot } from "../index";

import { CloseIcon, Logo } from "../Icons";
import Form from "./Form";

import { ActiveFormContext } from "components/Header/TopLinks";
import { SIGN_IN } from "script";

import StyledJoinUs from "./StyledJoinUs";

function JoinUs({ isShown, onClose, onReplace }) {
  const { handleFormChange } = useContext(ActiveFormContext);

  const handleClick = (e) => {
    e.preventDefault();
    onReplace();
    handleFormChange(SIGN_IN);
  };
  return (
    <StyledJoinUs
      id="ju"
      className={clsx({ active: isShown })}
      onClick={onClose}
    >
      <div className="join-us-ctn" onClick={(e) => e.stopPropagation()}>
        <div>
          <Logo w="45" h="45" style={{ display: "block", margin: "auto" }} />
        </div>
        <div className="sign-in-title title">BECOME A NIKE MEMBER</div>
        <div className="sign-in-content-ctn container">
          <Form />
          <p className="regular-font">
            Already a member?&nbsp;
            <a
              href="/"
              style={{ color: "#111" }}
              id="bottom-sign-in"
              onClick={handleClick}
            >
              Sign in.
            </a>
          </p>
        </div>
        <button className="close-btn" onClick={onClose}>
          <CloseIcon />
        </button>
      </div>
    </StyledJoinUs>
  );
}

export default toModalRoot(JoinUs);
// export default toModalRoot(React.forwardRef(JoinUs));
