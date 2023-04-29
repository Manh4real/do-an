import React, { useState, useEffect } from "react";
import { UserRecentSales } from "./types";
import { numberWithCommas } from "../../helpers";
import moment from "moment";
import { getDownloadUserAvatar } from "../../features/firebase";
import { Plus2 } from "../../Icons";

interface Props {
  recentSales: UserRecentSales[];
}

function RecentSales({ recentSales }: Props) {
  return (
    <div className="col-span-12 rounded-sm border border-gray-300 bg-white px-5 pt-7 pb-5 shadow-gray-200 shadow-md sm:px-7 xl:col-span-4">
      <h3 className="font-semibold uppercase mb-3">
        Recent sales{" "}
        <span className="lowercase text-sm ml-1">(last 7 days)</span>
      </h3>
      <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
        <thead className="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
          <tr>
            <th scope="col" className="px-6 py-3">
              User
            </th>
            <th scope="col" className="px-6 py-3">
              Purchased
            </th>
          </tr>
        </thead>
        <tbody>
          {recentSales.map(
            ({ avatar, created_at, total_price, user_id, user_name }, i) => (
              <tr
                key={i}
                className="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600"
              >
                <th
                  scope="row"
                  className="flex items-center px-6 py-4 text-gray-900 whitespace-nowrap dark:text-white"
                >
                  <Avatar imageName={avatar} />
                  <div className="pl-3">
                    <div className="text-base font-semibold">{user_name}</div>
                    <div className="text-gray-500 font-semibold">
                      {moment(new Date(created_at)).fromNow()}
                    </div>
                  </div>
                </th>

                <td className="text-green-400 px-6 py-4 font-bold">
                  <Plus2 /> {numberWithCommas(Number(total_price))}
                  <small className="text-xs ml-1 font-medium">VND</small>
                </td>
              </tr>
            )
          )}
        </tbody>
      </table>
    </div>
  );
}

const Avatar = ({ imageName }: { imageName: string }) => {
  const [url, setUrl] = useState("");

  useEffect(() => {
    getDownloadUserAvatar(imageName).then((url) => {
      if (url) setUrl(url);
    });
  }, [imageName]);

  if (!url) return <div className="w-10 h-10 rounded-full bg-gray-100"></div>;

  return (
    <img className="w-10 h-10 rounded-full object-cover" src={url} alt="Jese" />
  );
};

export default RecentSales;
