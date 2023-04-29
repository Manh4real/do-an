import React, { useState, useEffect } from "react";

// import Modal from "../../../components/Modal";
import FirstNameInput from "./FirstNameInput";
import LastNameInput from "./LastNameInput";
import EmailInput from "./EmailInput";
// import PasswordInput from "./PasswordInput";
import AvatarInput from "./AvatarInput";
import { useEditFormStore } from "../../../store/editForm";
import BirthdayInput from "./BirthdayInput";
import CountryInput from "./CountryInput";

import { IUser } from "../../../types";
import RoleInput from "./RoleInput";
import { updateUser } from "../../../services/users";
import { useRefreshContext } from "../../../context";

interface Props {
  title?: string;
  profile?: boolean;
  user: IUser;
  handleClose: () => void;
}

function Form({
  profile = false,
  title = "Edit User",
  user,
  handleClose,
}: Props) {
  const { data, isAllValid: _isAllValid, getAll } = useEditFormStore();
  const isAllValid = _isAllValid();

  const { updateData, init, reset } = useEditFormStore();

  const [loading, setLoading] = useState(false);

  const refreshContext = useRefreshContext();

  const handleCancel = () => {
    handleClose();
    reset();
  };
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!data) return;

    console.log(getAll());
    const body = getAll();

    if (body) {
      setLoading(true);
      updateUser(user.user_id, body)
        .then(() => {
          handleClose();
          refreshContext.handleRefresh();
        })
        .catch((err) => {
          // console.log(err.response.status);
          if (err.response?.status === 409) {
            updateData({
              email: {
                isValid: false,
                value: data.email.value,
                resonseError: err.response.data.error || "Email already exists",
              },
            });
          }
        })
        .finally(() => {
          setLoading(false);
        });
    }
  };

  useEffect(() => {
    init(user);
  }, [user, init]);

  if (!data) return <></>;

  return (
    <>
      <p className="text-indigo-700 text-xl uppercase font-extrabold mb-5 text-center my-3">
        {title}
      </p>

      <form onSubmit={handleSubmit}>
        <div className="space-y-12 mb-10">
          <div className="border-b border-gray-900/10 pb-12">
            <h2 className="text-base font-semibold leading-7 text-gray-900">
              Personal Information
            </h2>
            <p className="mt-1 text-sm leading-6 text-gray-600">
              Use a permanent address where you can receive mail.
            </p>

            <div className="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
              <FirstNameInput />
              <LastNameInput />
              <EmailInput />
              {/* <PasswordInput /> */}
              <BirthdayInput />
              <CountryInput />
              <AvatarInput url={user.avatar} />
              <RoleInput />
            </div>
          </div>
        </div>

        <div className="absolute bottom-0 left-0 right-0 bg-white border-t-2 border-t-gray-100 px-5 py-3 mt-6 flex items-center justify-end gap-x-6">
          {!profile && (
            <button
              type="button"
              disabled={loading}
              onClick={handleCancel}
              className="text-sm font-semibold leading-6 text-gray-900"
            >
              Cancel
            </button>
          )}
          <button
            type="submit"
            disabled={!isAllValid || loading}
            className=" disabled:bg-indigo-300 w-32 rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          >
            {loading ? "Processing..." : "Save changes"}
          </button>
        </div>
      </form>
    </>
  );
}

export default Form;
