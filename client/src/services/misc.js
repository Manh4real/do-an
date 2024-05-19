import api from "api";
import { getAccessTokenFromLocalStorage } from "helpers";

export const getSizes = async () => {
  try {
    const response = await api.get("/sizes");

    return response.data.data.sizes;
  } catch (err) {
    console.log(err);
  }
};

export const getOrderStatuses = async () => {
  try {
    const response = await api.get("/order-statuses");

    return response.data.data.order_statuses;
  } catch (err) {
    console.log(err);
  }
};

export const createProvinces = async () => {
  try {
    await api.post("/provinces");

    return true;
  } catch (err) {
    console.log(err);
  }
  return false;
};

export const updateOrder = async ({ orderId, status }) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    await api.post(
      "/orders/status/" + orderId,
      { status },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    return true;
  } catch (err) {
    console.log(err);
  }

  return false;
};
