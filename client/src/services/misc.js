import api from "api";

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
    const response = await api.get("/order_statuses");

    return response.data.data.order_statuses;
  } catch (err) {
    console.log(err);
  }
};
