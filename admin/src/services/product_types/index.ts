import { AxiosRequestConfig, GenericAbortSignal } from "axios";
import { api } from "../../api";
import { getAccessTokenFromLocalStorage } from "../../helpers";
import { IProductTypeFormData } from "../../types";
import { deleteProductImage } from "../../features/firebase";

// PRODUCT TYPE
export const getProductTypeList = async (page = 1, options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}) => {
    try {
        const response = await api.get("/types", {
            ...options
        });

        return response.data;
    } catch (err) {

    }
}
export const deleteProductType = async (typeId: string, options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}) => {
    try {
        const token = getAccessTokenFromLocalStorage();
        const response = await api.post("/delete/types/" + typeId, null, {
            headers: {
                Authorization: `Bearer ${token}`,
            },
            ...options
        })

        if (response.data.status === "success") {
            const imageNames = response.data?.data?.images;

            if (Array.isArray(imageNames) && imageNames.length > 0) {
                for (let i = 0; i < imageNames.length; i++) {
                    await deleteProductImage(imageNames[i].url);
                }
            }
        }

        return true;
    } catch (err) {
        console.log(err);
    }

    return false;
}
export const createNewProductType = async (data: IProductTypeFormData) => {
    try {
        const token = getAccessTokenFromLocalStorage();
        await api.post("/types", data, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        })
        return true;
    } catch (err) {
        console.log(err);
    }
    return false;
}
export const updateProductType = async (typeId: string, data: IProductTypeFormData) => {
    try {
        const token = getAccessTokenFromLocalStorage();
        await api.put("/types/" + typeId, data, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        })
        return true;
    } catch (err) {
        console.log(err);
    }
    return false;
}