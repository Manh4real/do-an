import api from "api";

export const getColorNameById = async (id, options = {}) => {
  const result = await api.get("/colors/" + id, { ...options });
  const colorName = result.data.data.color.color_name;
  return colorName;
};
