import React from "react";
import { Link } from "react-router-dom";

function AccountAvatar({ url }) {
  return (
    <Link to="/account">
      <div className="profile__user-image bd-rd-50p overflow-hidden flex-center">
        <img src={url} alt="" className="w-100" />
      </div>
    </Link>
  );
}

export default AccountAvatar;
