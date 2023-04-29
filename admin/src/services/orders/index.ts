import { api } from "../../api";
import { getAccessTokenFromLocalStorage } from "../../helpers";
// import { IOrderStatusState } from "../../pages/Orders/types";

export const getOrders = async (page: number = 1, status: string) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        const response = await api.get("/a/orders", {
            params: {
                page,
                status
            },
            headers: {
                Authorization: `Bearer ${token}`
            },
        })

        return response.data;
    } catch (err) {
        console.log(err);
    }
}

export const getOrderById = async (orderId: string) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        const response = await api.get("/orders/" + orderId, {
            headers: {
                Authorization: `Bearer ${token}`
            },
        })

        return response.data.data.order;
    } catch (err) {
        console.log(err);
    }
}

export const updateOrder = async ({ orderId, status, arrivedDate }: { orderId: string, status: string, arrivedDate: string }) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        const response = await api.post("/orders/status/" + orderId, { status, arrivedDate }, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        })

        return response.data;
    } catch (err) {
        console.log(err);
    }
}

export const deleteOrder = async (orderId: string) => {
    try {
        const token = getAccessTokenFromLocalStorage();

        const response = await api.post("/orders/" + orderId, null, {
            headers: {
                Authorization: `Bearer ${token}`
            }
        })

        return response.data;
    } catch (err) {
        console.log(err);
    }
}