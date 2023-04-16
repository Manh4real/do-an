import React from "react";
import { Link } from "react-router-dom";

import StyledJoinUsPage from "./StyledJoinUsPage";
import Form from "components/JoinUs/Form";
import Logo from "components/Icons/Logo";

function JoinUsPage() {
  return (
    <StyledJoinUsPage>
      <header>
        <Logo w="45" h="45" style={{ display: "block", margin: "auto" }} />
      </header>
      <div className="title bold-font large-font">BECOME A NIKE MEMBER</div>
      <Form />
      <p className="bottom-text regular-font grey-font">
        Already a member?&nbsp;
        <Link to="/sign-in" style={{ color: "#111" }}>
          Sign in.
        </Link>
      </p>
    </StyledJoinUsPage>
  );
}

export default JoinUsPage;
