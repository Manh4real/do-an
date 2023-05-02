import React from "react";

import Email from "../Email/Email";
import PasswordInput from "../PasswordInput/PasswordInput";
import { CountrySelect, NameInputs, BirthdayInput, Checkbox } from "./index";

import { withSubmit } from "hoc";
import { SIGN_UP } from "script";

import StyledForm from "components/StyledForm";

function Form({ handleSubmit, first, validation, processing }) {
  return (
    <StyledForm onSubmit={handleSubmit}>
      <Email first={first} validateEmail={validation.validateEmail} />
      <PasswordInput
        first={first}
        validatePassword={validation.validatePassword}
      />
      <NameInputs first={first} validateName={validation.validateName} />
      <BirthdayInput
        first={first}
        validateBirthday={validation.validateBirthday}
      />
      <CountrySelect
        first={first}
        validateCountry={validation.validateCountry}
      />
      <Checkbox
        checked={false}
        validateCheckbox={validation.validateCheckbox}
      />
      <p>
        By creating an account, you agree to 4TW's&nbsp;
        <a href="/">Privacy Policy</a> and&nbsp;
        <a href="/">Terms of Use</a>.
      </p>

      <div className="form__submit-btn-ctn sign-in-btn-ctn">
        <button
          type="submit"
          disabled={processing}
          className="form__submit-btn sign-in-btn"
        >
          {processing ? "PROCESSING..." : "JOIN US"}
        </button>
      </div>
    </StyledForm>
  );
}

// export default Form;
export default withSubmit(Form, SIGN_UP);
