import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";

import { LoginIcon, LogoutIcon } from "../../Icons";

import { useUserStore } from "../../store/user";
import { getDownloadUserAvatar } from "../../features/firebase";

function AccountSection() {
  const [imageUrl, setImageUrl] = useState<string>("");

  const userStore = useUserStore();
  const user = userStore.data;

  useEffect(() => {
    if (user)
      getDownloadUserAvatar(user.avatar).then((url) => {
        if (url) {
          setImageUrl(url);
        }
      });
  }, [user]);

  if (!user)
    return (
      <div className="font-medium hover:text-indigo-600">
        <Link
          to={"sign-in"}
          className="ml-auto w-max mb-5 flex flex-row items-center gap-2"
        >
          Log in <LoginIcon />
        </Link>
      </div>
    );

  return (
    <div className="flex justify-around pb-6 mt-8">
      <div className="flex flex-col items-center">
        <Link to="/account" className="rounded-full w-16 h-16 overflow-hidden">
          <img
            className="w-[100%] h-[100%] object-cover"
            src={imageUrl || user.avatar}
            alt=""
          />
        </Link>
        <div className="font-semibold text-lg">
          {user.first_name + " " + user.last_name}
        </div>
        <p className="mb-2 text-sm">{user.role === "0" && "(Admin)"}</p>
        <div className="font-thin text-gray-400 text-sm">{user.email}</div>
      </div>

      <Link
        to="/logout"
        role="button"
        className="cursor-pointer self-end grid place-items-center w-12 h-12 hover:opacity-60"
      >
        <LogoutIcon />
      </Link>
    </div>
  );
}

export default AccountSection;
