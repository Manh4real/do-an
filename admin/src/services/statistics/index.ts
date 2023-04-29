import { api } from "../../api";
import { getAccessTokenFromLocalStorage } from "../../helpers";

export const getStatistics = async () => {
    try {
        const token = getAccessTokenFromLocalStorage();
        const result = await api.get('/statistics', {
            headers: {
                Authorization: `Bearer ${token}`
            }
        });

        return result.data.data;
    } catch (err) {
        console.log(err);
    }
}