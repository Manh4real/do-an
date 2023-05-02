import React, { useMemo, useState } from "react";

import { Validation } from "../../../script";

import StyledChangePassword from "./StyledChangePassword";
import clsx from "clsx";
import { CHANGE_PASSWORD } from "../../../constants";
import { changePassword } from "services/users";

function Form({ handleClose }) {
  const validate = useMemo(() => {
    return new Validation(CHANGE_PASSWORD);
  }, []);

  const [formData, setFormData] = useState({
    password: "",
    oldPassword: "",
    confirmPassword: "",
  });
  const [error, setError] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();

    if (!isAllValid) return;

    setLoading(true);
    changePassword({
      oldPassword: formData.oldPassword,
      newPassword: formData.password,
    })
      .then((response) => {
        if (response.response.status === 409) {
          setError(response.response.data?.message || "Something went wrong");
          return;
        }
        // console.log(data);
        alert("Changed password successfully.");
        handleClose();
      })
      .catch((err) => {
        setError(err.response.data?.message || "Something went wrong");
      })
      .finally(() => {
        setLoading(false);
      });
  };

  const isPasswordValid = validate.validatePassword(formData.password);
  const isOldPasswordValid = validate.validateOldPassword(formData.oldPassword);
  const isConfirmPasswordInvalid =
    formData.confirmPassword !== "" &&
    formData.password !== formData.confirmPassword;

  const isAllValid =
    formData.password !== "" &&
    formData.oldPassword !== "" &&
    formData.confirmPassword !== "" &&
    validate.isAllValid() &&
    !isConfirmPasswordInvalid;

  return (
    <StyledChangePassword>
      <header>
        <div className="title">CHANGE PASSWORD</div>
        <p className="subtitle"></p>
      </header>

      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="oldPassword">Old password:</label>
          <input
            type="password"
            className={clsx({
              "is--error":
                error || (formData.oldPassword !== "" && isOldPasswordValid),
            })}
            name="oldPassword"
            id="oldPassword"
            value={formData.oldPassword}
            onChange={(e) => {
              setError("");
              setFormData((prev) => ({ ...prev, oldPassword: e.target.value }));
            }}
          />
          <div className="absolute">
            {(error && <p className="invalid-message absolute">{error}</p>) ||
              (formData.oldPassword !== "" && isOldPasswordValid)}
          </div>
        </div>
        <div className="form-group">
          <label htmlFor="password">New password:</label>
          <input
            type="password"
            className={clsx({
              "is--error": formData.password !== "" && isPasswordValid,
            })}
            name="password"
            id="password"
            value={formData.password}
            onChange={(e) => {
              setFormData((prev) => ({ ...prev, password: e.target.value }));
            }}
          />
          <div className="absolute">
            {formData.password !== "" && isPasswordValid}
          </div>
        </div>
        <div className="form-group">
          <label htmlFor="confirmPassword">Confirm new password:</label>
          <input
            type="password"
            className={clsx({
              "is--error": isConfirmPasswordInvalid,
            })}
            name="confirmPassword"
            id="confirmPassword"
            value={formData.confirmPassword}
            onChange={(e) => {
              setFormData((prev) => ({
                ...prev,
                confirmPassword: e.target.value,
              }));
            }}
          />
          {isConfirmPasswordInvalid && (
            <p className="invalid-message absolute">
              Confirm password not match
            </p>
          )}
        </div>
        <div>
          <button type="submit" disabled={!isAllValid}>
            {loading ? "PROCESSING..." : "Save"}
          </button>
        </div>
      </form>
    </StyledChangePassword>
  );
}

export default Form;
