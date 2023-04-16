import api from "api";

export const getReviews = async (productId, page = 1, options = {}) => {
  const result = await api.get("/reviews/" + productId, {
    params: {
      page,
    },
    ...options,
  });

  return result.data;
};
