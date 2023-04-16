import React from "react";

function AccountAvatar({ url }) {
  return (
    <a href="/account">
      <div className="profile__user-image bd-rd-50p overflow-hidden flex-center">
        <img src={url} alt="" className="w-100" />
      </div>
    </a>
  );
}

export default AccountAvatar;
