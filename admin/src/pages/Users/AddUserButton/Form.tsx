import React, { useState } from "react";

import Modal from "../../../components/Modal";
import FirstNameInput from "./FirstNameInput";
import LastNameInput from "./LastNameInput";
import EmailInput from "./EmailInput";
import PasswordInput from "./PasswordInput";
import AvatarInput from "./AvatarInput";
import { useAddFormStore } from "../../../store/addForm";
import BirthdayInput from "./BirthdayInput";
import CountryInput from "./CountryInput";
import { createNewUser } from "../../../services/users";
import { useRefreshContext } from "../../../context";

interface Props {
  handleClose: () => void;
}

function Form({ handleClose }: Props) {
  const { data, isAllValid: _isAllValid, getAll } = useAddFormStore();
  const isAllValid = _isAllValid();
  const { updateData } = useAddFormStore();

  const [loading, setLoading] = useState(false);

  const refreshContext = useRefreshContext();

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    if (!data) return;

    console.log(getAll());
    setLoading(true);
    createNewUser(getAll())
      .then(() => {
        handleClose();
        refreshContext.handleRefresh();
      })
      .catch((err) => {
        if (err.response.status === 409) {
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
  };

  return (
    <Modal>
      <p className="text-indigo-700 text-xl uppercase font-extrabold mb-5 text-center my-3">
        Add new user
      </p>

      <form onSubmit={handleSubmit} autoComplete="off">
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
              <PasswordInput />
              <BirthdayInput />

              <CountryInput />

              <AvatarInput />

              <div className="sm:col-span-3">
                <label
                  htmlFor="role"
                  className="block text-sm font-medium leading-6 text-gray-900"
                >
                  Role
                </label>
                <div className="mt-2">
                  <select
                    id="role"
                    name="role"
                    autoComplete="role-name"
                    className="px-2 block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:max-w-xs sm:text-sm sm:leading-6"
                    defaultValue={1}
                  >
                    <option value={0}>Admin</option>
                    <option value={1}>Customer</option>
                    <option value={2}>Inventory Manager</option>
                  </select>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className="absolute bottom-0 left-0 right-0 bg-white border-t-2 border-t-gray-100 px-5 py-3 mt-6 flex items-center justify-end gap-x-6">
          <button
            type="button"
            disabled={loading}
            onClick={handleClose}
            className="text-sm font-semibold leading-6 text-gray-900"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={!isAllValid || loading}
            className=" disabled:bg-indigo-300 w-32 rounded-md bg-indigo-600 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
          >
            {loading ? "Processing..." : "Submit"}
          </button>
        </div>
      </form>
    </Modal>
  );
}

export default Form;
