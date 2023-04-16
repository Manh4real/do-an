import React from "react";
import { Link, useLocation } from "react-router-dom";

import SignIn from "../SignIn/SignIn";

import withForm from "../../hoc/withForm";
import { SIGN_IN } from "script";

import "../SignIn/SignIn.css";

function SignInBlock({ activeForm, show, onReplace, onClose, handleClick }) {
  const location = useLocation();

  return (
    <div className="sign-in-container">
      <Link
        to="/"
        id="sign-in"
        onClick={handleClick}
        state={{ from: location }}
      >
        Sign In
      </Link>
      {(activeForm === SIGN_IN || show) && (
        <SignIn
          onReplace={onReplace}
          isShown={show || activeForm === SIGN_IN}
          onClose={onClose}
        />
      )}
    </div>
  );
}

// export default SignInBlock;
export default React.memo(withForm(SignInBlock));
