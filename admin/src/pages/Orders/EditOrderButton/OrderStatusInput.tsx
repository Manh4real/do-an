import React, { useState, useEffect } from "react";
import Spinner from "../../../components/Spinner";

import { getOrderStatuses } from "../../../services/misc";
import { IOrderStatusState } from "../types";

interface Props {
  status: IOrderStatusState;
  handleChangeStatus: (status: IOrderStatusState) => void;
}

function OrderStatusInput({
  status: selectedStatus,
  handleChangeStatus,
}: Props) {
  const [loading, setLoading] = useState(false);
  const [statuses, setStatuses] = useState<IOrderStatusState[]>([]);
  // const [selected, setSelected] = useState<IOrderStatusState>({
  //   order_status_id: status.order_status_id,
  //   order_status_name: status.order_status_name,
  // });

  const handleChange = (status: IOrderStatusState) => {
    // setSelected(status);
    handleChangeStatus(status);
  };

  useEffect(() => {
    setLoading(true);
    getOrderStatuses()
      .then((data) => {
        setStatuses(data.data.order_statuses);
        //   setSelected(data.data.order_statuses[0]);
      })
      .finally(() => {
        setLoading(false);
      });
  }, []);

  return (
    <>
      <p className="block text-sm font-medium leading-6 text-gray-900">
        Order Status
      </p>
      <div className="flex gap-2 p-2 flex-wrap">
        {loading && <Spinner />}

        {statuses.map((status) => {
          return (
            <div
              key={status.order_status_name}
              className="flex w-1/6 gap-x-3 items-center"
            >
              <input
                id={"status-" + status.order_status_name}
                name="status"
                type="checkbox"
                value={status.order_status_id}
                checked={
                  status.order_status_id === selectedStatus.order_status_id
                }
                onChange={() => {
                  handleChange(status);
                }}
                className="hidden h-4 w-4 rounded border-gray-300 text-indigo-600 focus:ring-indigo-600"
              />
              <label
                htmlFor={"status-" + status.order_status_name}
                className="text-sm capitalize ring-1 ring-gray-200 rounded w-full h-10 items-center flex justify-center cursor-pointer font-medium text-gray-900 hover:bg-gray-100 focus-visible:outline-indigo-800"
              >
                {status.order_status_name}
              </label>
            </div>
          );
        })}
      </div>
    </>
  );
}

export default OrderStatusInput;
