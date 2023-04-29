import React, { useState, useCallback } from "react";
import Modal from "../../../components/Modal";
import { IOrder } from "../../../types";

import "./Form.css";
import ArrivedDateInput from "./ArrivedDateInput";
import OrderStatusInput from "./OrderStatusInput";

import { useRefreshContext } from "../../../context";
import { updateOrder } from "../../../services/orders";
import { IOrderStatusState } from "../types";
import { isInThePast } from "../../../helpers";

interface Props {
  order: IOrder;
  handleClose: () => void;
}
interface FormData {
  orderStatus: {
    value: IOrderStatusState;
    isValid: boolean;
  };
  arrivedDate: {
    value: string;
    isValid: boolean;
  };
}

function Form({ order, handleClose }: Props) {
  const [data, setData] = useState<FormData>({
    arrivedDate: {
      value: order.est_arrived_date,
      isValid: true,
      // isValid: !isInThePast(new Date(order.est_arrived_date)),
    },
    orderStatus: {
      value: {
        order_status_id: order.order_status_id,
        order_status_name: order.order_status_name,
      },
      isValid: true,
    },
  });

  const refreshContext = useRefreshContext();

  const handleChangeStatus = useCallback((status: IOrderStatusState) => {
    setData((prev) => ({
      ...prev,
      orderStatus: {
        value: status,
        isValid: true,
      },
    }));
  }, []);
  const handleChangeArrivedDate = useCallback(
    (arrivedDate: string, isValid: boolean) => {
      setData((prev) => ({
        ...prev,
        arrivedDate: {
          isValid,
          value: arrivedDate,
        },
      }));
    },
    []
  );

  const handleSave = () => {
    updateOrder({
      orderId: order.order_id,
      status: data.orderStatus.value.order_status_id,
      arrivedDate: data.arrivedDate.value,
    })
      .then((data) => {
        console.log(`Updated order #${order.order_id} status`, data);
        refreshContext.handleRefresh();
      })
      .finally(() => {
        handleClose();
      });
  };

  const isAllValid = data.arrivedDate.isValid && data.orderStatus.isValid;

  return (
    <Modal>
      <p className="font-medium text-2xl mb-5">Edit order #{order.order_id}</p>

      <OrderStatusInput
        status={data.orderStatus.value}
        handleChangeStatus={handleChangeStatus}
      />

      <ArrivedDateInput
        arrivedDate={data.arrivedDate}
        handleChangeArrivedDate={handleChangeArrivedDate}
      />

      <div className="w-max ml-auto mt-5">
        <button
          type="button"
          onClick={() => {
            if (isAllValid) {
              handleSave();
            }
          }}
          disabled={!isAllValid}
          className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800 disabled:opacity-50 disabled:cursor-not-allowed disabled:pointer-events-none"
        >
          Save
        </button>
        <button
          type="button"
          onClick={() => {
            handleClose();
          }}
          className="py-2.5 px-5 mr-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
        >
          Close
        </button>
      </div>
    </Modal>
  );
}

export default Form;
