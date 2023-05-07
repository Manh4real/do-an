import React, { useEffect, useState } from "react";
import { getDownloadUserAvatar } from "../../features/firebase";

import { IUser } from "../../types";
import DeleteButton from "./DeleteButton";
import EditUserButton from "./EditUserButton";
import moment from "moment";

interface Props {
  user: IUser;
  nth: number;
}

function UserTableRow({ user, nth }: Props) {
  const [avatar, setAvatar] = useState("");

  useEffect(() => {
    let ignore = false;
    getDownloadUserAvatar(user.avatar).then((url) => {
      if (!ignore) {
        url && setAvatar(url);
      }
    });

    return () => {
      ignore = true;
    };
  }, [user.avatar]);

  const _user = {
    ...user,
    avatar: avatar || user.avatar,
  };

  return (
    <tr>
      <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
        {nth}
      </td>
      <td className="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
        <div className="inline-flex items-center gap-x-3">
          <div className="flex items-center gap-x-2">
            {avatar ? (
              <img
                className="object-cover w-10 h-10 rounded-full"
                src={avatar}
                alt=""
              />
            ) : (
              <div className="object-cover w-10 h-10 rounded-full bg-gray-50 border-2 border-gray-200"></div>
            )}
            <div>
              <h2 className="font-medium text-gray-800">
                {user.first_name + user.last_name}
              </h2>
              <p className="text-xs font-normal text-gray-500">{user.email}</p>
            </div>
          </div>
        </div>
      </td>
      <td className="px-12 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
        <div className="inline-flex items-center px-3 py-1 rounded-full gap-x-2 bg-emerald-100/60">
          <span className="h-1.5 w-1.5 rounded-full bg-emerald-500"></span>

          <h2 className="text-sm font-normal text-emerald-500">Active</h2>
        </div>
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {user.role === "0" && "Admin"}
        {user.role === "1" && "Customer"}
        {user.role === "2" && "Inventory Manager"}
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {user.email}
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {/* {new Date(user.birthday).toUTCString().slice(4, 17)} */}
        {moment(new Date(user.birthday)).format("ll")}
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {user.country}
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        {/* {new Date(+user.registration_time).toUTCString().slice(4, 17)} */}
        {moment(new Date(+user.registration_time)).format("ll")}
      </td>
      <td className="px-4 py-4 text-sm whitespace-nowrap">
        <div className="flex items-center gap-x-6">
          <DeleteButton userId={user.user_id} />
          <EditUserButton user={_user} />
        </div>
      </td>
    </tr>
  );
}

export default UserTableRow;
