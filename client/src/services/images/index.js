import api from "api";

export const getImagesByProductID = async (product_id, options = {}) => {
	const result = await api.get("/images/product_id/" + product_id, {...options});
	return result.data;
}
export const getImagesByProductsIDs = async (products_ids, options = {}) => {
	const result = await api.get("/images?products_ids=" + products_ids.join(","), {...options});
	return result.data;
}