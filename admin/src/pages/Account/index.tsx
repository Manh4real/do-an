import React, { useState, useEffect } from "react";
import Form from "../Users/EditUserButton/Form";
import { useUserStore } from "../../store/user";
import { getDownloadUserAvatar } from "../../features/firebase";
import { To, useNavigate } from "react-router-dom";

function Account() {
  const user = useUserStore();
  const [imageUrl, setImageUrl] = useState("");

  const navigate = useNavigate();

  useEffect(() => {
    if (user.data) {
      getDownloadUserAvatar(user.data.avatar).then((url) => {
        if (url) setImageUrl(url);
      });
    }
  }, [user]);

  if (!user.data) return <></>;

  return (
    <div className="relative mb-10 mr-10">
      <div className="h-[90vh] overflow-auto p-3 xl:px-32">
        <Form
          title="Profile"
          user={{
            ...user.data,
            avatar: imageUrl || user.data.avatar,
          }}
          handleClose={() => {
            alert("Profile updated!");
            navigate(0 as To, { replace: true });
          }}
          profile={true}
        />
      </div>
    </div>
  );
}

export default Account;
