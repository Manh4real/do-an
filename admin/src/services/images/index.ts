import { api } from "../../api";
import { getAccessTokenFromLocalStorage } from "../../helpers";

interface IImagePostData {
    url: string,
    product_id: string,
    product_color_id: string
}
export const uploadProductImages = async (data: IImagePostData[]) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        const response = await api.post("/images/multiple", data, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });

        return response.data;
    } catch (err) {
        console.log(err);
    }
}

export const uploadProductImage = async (data: IImagePostData) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        const response = await api.post("/images", data, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });

        return response.data.data.image;
    } catch (err) {
        console.log(err);
    }
}

export const deleteImages = async (ids: string[]) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        await api.delete("/images", {
            headers: {
                Authorization: `Bearer ${token}`
            },
            params: {
                ids: ids.join(",")
            }
        });

        return true;
    } catch (err) {
        console.log(err);
    }
    return false;
}