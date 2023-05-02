import { api } from '../../api';
import { getAccessTokenFromLocalStorage } from '../../helpers';

export const getReviews = async (page: number = 1, options = {}) => {
    const token = getAccessTokenFromLocalStorage();

    const response = await api.get("/reviews", {
        params: {
            page
        },
        headers: {
            Authorization: `Bearer ${token}`
        },
        ...options
    })

    return response.data;
}

interface DeleteReviewParams {
    user_id: string;
    product_id: string;
}
export const deleteReview = async ({ user_id, product_id }: DeleteReviewParams, options = {}) => {
    const token = getAccessTokenFromLocalStorage();

    const response = await api.delete("/reviews", {
        params: {
            user_id,
            product_id
        },
        headers: {
            Authorization: `Bearer ${token}`
        }
    })

    return response.data;
}