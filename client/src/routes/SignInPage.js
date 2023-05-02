import React from "react";
import { Link } from "react-router-dom";

import Logo from "components/Icons/Logo";
import Form from "components/SignIn/Form";

import StyledSignInPage from "./StyledSignInPage";

function SignInPage() {
  return (
    <StyledSignInPage>
      <div>
        <Logo h="45" w="45" styles={{ display: "block", margin: "auto" }} />
      </div>
      <div className="sign-in-title bold-font">
        YOUR ACCOUNT FOR <br />
        EVERYTHING 4TW
      </div>
      <Form />
      <p className="bottom-text grey-font">
        Not a member?&nbsp;
        <Link to="/join-us" style={{ color: "#111" }}>
          Join Us.
        </Link>
      </p>
    </StyledSignInPage>
  );
}

export default SignInPage;
