import React, { useState } from "react";
import AvatarInput from "./AvatarInput";

import { useUser } from "features/user/userSlice";

import StyledEditProfileForm from "./StyledEditProfileForm";
import { PROFILE } from "../../../constants";
import { withSubmit } from "hoc";
import FirstNameInput from "./FirstNameInput";
import LastNameInput from "./LastNameInput";
import EmailInput from "./EmailInput";
import PasswordInput from "./PasswordInput";

function EditProfileForm({
  processing,
  handleSubmit: _handleSubmit,
  validation,
  handleClose,
}) {
  const user = useUser();

  const [isAllValid, setIsAllValid] = useState(validation.isAllValid());

  const handleSubmit = (e) => {
    _handleSubmit(e, {
      onSuccess: () => {
        handleClose(); // close modal
      },
    });
  };

  return (
    <StyledEditProfileForm method="put" onSubmit={handleSubmit}>
      <header>
        <div className="title">EDIT PROFILE</div>
        <p className="subtitle"></p>
      </header>

      <div className="form-group avatar">
        <label htmlFor="avatar">
          <div className="form-control-container">
            <AvatarInput
              avatar={user.avatar}
              validateAvatar={validation.validateAvatar}
              setIsAllValid={() => {
                setIsAllValid(validation.isAllValid());
              }}
            />
          </div>
          <div className="icon flex-center">
            <svg
              clipRule="evenodd"
              fillRule="evenodd"
              strokeLinejoin="round"
              strokeMiterlimit="2"
              width={18}
              height={18}
              viewBox="0 0 24 24"
              xmlns="http://www.w3.org/2000/svg"
            >
              <path
                d="m19 20.25c0-.402-.356-.75-.75-.75-2.561 0-11.939 0-14.5 0-.394 0-.75.348-.75.75s.356.75.75.75h14.5c.394 0 .75-.348.75-.75zm-7.403-3.398 9.124-9.125c.171-.171.279-.423.279-.684 0-.229-.083-.466-.28-.662l-3.115-3.104c-.185-.185-.429-.277-.672-.277s-.486.092-.672.277l-9.143 9.103c-.569 1.763-1.555 4.823-1.626 5.081-.02.075-.029.15-.029.224 0 .461.349.848.765.848.511 0 .991-.189 5.369-1.681zm-3.27-3.342 2.137 2.137-3.168 1.046zm.955-1.166 7.651-7.616 2.335 2.327-7.637 7.638z"
                fillRule="nonzero"
              />
            </svg>
          </div>
        </label>
      </div>
      <div className="form-group">
        <label htmlFor="firstName">First Name</label>
        <div className="form-control-container">
          <FirstNameInput
            validateFirstName={validation.validateFirstName}
            initialValue={user.name.firstName.trim()}
            setIsAllValid={() => {
              setIsAllValid(validation.isAllValid());
            }}
          />
          <p className="form-info"></p>
        </div>
      </div>
      <div className="form-group">
        <label htmlFor="lastName">Last Name</label>
        <div className="form-control-container">
          <LastNameInput
            validateLastName={validation.validateLastName}
            initialValue={user.name.lastName.trim()}
            setIsAllValid={() => {
              setIsAllValid(validation.isAllValid());
            }}
          />

          <p className="form-info"></p>
        </div>
      </div>
      <div className="form-group">
        <label htmlFor="email">Email</label>
        <div className="form-control-container">
          <EmailInput
            validateEmail={validation.validateEmail}
            initialValue={user.email.trim()}
            setIsAllValid={() => {
              setIsAllValid(validation.isAllValid());
            }}
          />

          <p className="form-info"></p>
        </div>
      </div>
      <div className="form-group">
        <label htmlFor="password">Password</label>
        <div className="form-control-container">
          <PasswordInput
            validatePassword={validation.validatePassword}
            initialValue={user.password}
            setIsAllValid={() => {
              setIsAllValid(validation.isAllValid());
            }}
          />

          <p className="form-info"></p>
        </div>
      </div>
      <button disabled={!isAllValid} type="submit">
        {processing ? "PROCESSING..." : "SAVE"}
      </button>
    </StyledEditProfileForm>
  );
}

export default withSubmit(EditProfileForm, PROFILE);
