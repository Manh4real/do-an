import React from "react";

import Email from "../Email/Email";
import PasswordInput from "../PasswordInput/PasswordInput";
import Checkbox from "./Checkbox";

import { Validation, SIGN_IN } from "script";

import { withSubmit } from "hoc";
import StyledForm from "components/StyledForm";
import { Link } from "react-router-dom";

export const ValidationContext = React.createContext(new Validation());

function Form({ handleSubmit, first, validation, processing }) {
  return (
    <ValidationContext.Provider value={validation}>
      <StyledForm onSubmit={handleSubmit}>
        <Email first={first} validateEmail={validation.validateEmail} />
        <PasswordInput
          first={first}
          validatePassword={validation.validatePassword}
        />
        <Checkbox
          checked={true}
          validateKeepSignIn={validation.validateKeepSignIn}
        />

        <p className="grey-font">
          By logging in, you agree to 4TW's&nbsp;
          <Link to="/" style={{ textDecoration: "underline" }}>
            Privacy Policy
          </Link>
          &nbsp; and&nbsp;
          <Link to="/" style={{ textDecoration: "underline" }}>
            Terms of Use
          </Link>
          .
        </p>

        <div className="form__submit-btn-ctn sign-in-btn-ctn">
          <button
            type="submit"
            disabled={processing}
            className="form__submit-btn sign-in-btn"
          >
            {processing ? "PROCESSING..." : "SIGN IN"}
          </button>
        </div>
      </StyledForm>
    </ValidationContext.Provider>
  );
}

// export default Form;
export default withSubmit(Form, SIGN_IN);
