import api from "api";

export const getSizes = async () => {
  try {
    const response = await api.get("/sizes");

    return response.data.data.sizes;
  } catch (err) {
    console.log(err);
  }
};
