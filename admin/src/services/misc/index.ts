import { AxiosRequestConfig, GenericAbortSignal } from "axios";
import { api } from "../../api";
import { getAccessTokenFromLocalStorage } from "../../helpers";

export const getManufacturers = async (
  options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}
) => {
  try {
    const response = await api.get("/manufacturers", {
      ...options,
    });

    return response.data.data.manufacturers;
  } catch (err) {}
};

export const getProductTypes = async (
  options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}
) => {
  try {
    const response = await api.get("/types", {
      ...options,
    });

    return response.data.data.types;
  } catch (err) {}
};

export const getProductStyles = async (
  options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}
) => {
  try {
    const response = await api.get("/styles", {
      ...options,
    });

    return response.data.data.styles;
  } catch (err) {}
};

export const getOrderStatuses = async () => {
  try {
    const response = await api.get("/order-statuses");

    return response.data;
  } catch (err) {
    console.log(err);
  }
};

export const getSizes = async () => {
  try {
    const response = await api.get("/sizes");

    return response.data.data.sizes;
  } catch (err) {
    console.log(err);
  }
};
export const getSizesByIds = async (ids: string[]) => {
  try {
    const response = await api.get("/sizes/multiple", {
      params: {
        ids: ids.join(","),
      },
    });

    return response.data.data.sizes;
  } catch (err) {
    console.log(err);
  }
};

export const getStockByProductId = async (productId: string) => {
  try {
    const response = await api.get("/stock/" + productId);

    return response.data.data.stock;
  } catch (err) {
    console.log(err);
  }
};

export const getStocks = async (page: number = 1) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    const response = await api.get("/stock", {
      params: {
        page,
      },
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    return response.data;
  } catch (err) {
    console.log(err);
  }
};

export const updateStock = async (quantity: number, stock_id: string) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    await api.put(
      "/stock/" + stock_id,
      {
        quantity,
      },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    return true;
  } catch (err) {
    console.log(err);
    return false;
  }
};
