import { AxiosRequestConfig, GenericAbortSignal } from "axios";
import { api } from "../../api";
import { getAccessTokenFromLocalStorage } from "../../helpers";
import { IManufacturerFormData } from "../../types";
import { deleteProductImage } from "../../features/firebase";

export const getManufacturers = async (
  page = 1,
  options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}
) => {
  try {
    const response = await api.get("/manufacturers", {
      params: { page },
      ...options,
    });

    return response.data;
  } catch (err) {}
};
export const deleteManufacturer = async (
  manufacturerId: string,
  options: AxiosRequestConfig<{ signal: GenericAbortSignal }> = {}
) => {
  try {
    const token = getAccessTokenFromLocalStorage();
    const response = await api.post(
      "/manufacturers/delete/" + manufacturerId,
      null,
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
        ...options,
      }
    );

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
};
export const createNewManufacturer = async (data: IManufacturerFormData) => {
  try {
    const token = getAccessTokenFromLocalStorage();
    await api.post("/manufacturers", data, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return true;
  } catch (err) {
    console.log(err);
  }
  return false;
};
export const updateManufacturer = async (
  manufacturerId: string,
  data: IManufacturerFormData
) => {
  try {
    const token = getAccessTokenFromLocalStorage();
    await api.put("/manufacturers/" + manufacturerId, data, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
    return true;
  } catch (err) {
    console.log(err);
  }
  return false;
};
