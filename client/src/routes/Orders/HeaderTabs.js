import clsx from "clsx";
import React, { useEffect, useState } from "react";

import { getOrderStatuses } from "services/misc";

function HeaderTabs({ activeStatus, setActiveStatus }) {
  const [statuses, setStatuses] = useState([]);

  useEffect(() => {
    getOrderStatuses().then((data) => {
      setStatuses(data);
      setActiveStatus(data[0]);
    });
  }, [setActiveStatus]);

  return (
    <div className="header__tabs flex-center mt-25">
      {statuses.map((status, i) => {
        return (
          <button
            key={i}
            onClick={() => {
              setActiveStatus(status);
            }}
            className={clsx("flex-1 p-10 regular-font capitalized-text", {
              active: activeStatus.order_status_id === status.order_status_id,
            })}
          >
            {status.order_status_name}
          </button>
        );
      })}
    </div>
  );
}

export default HeaderTabs;
