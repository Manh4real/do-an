import api from "../../api";

import { getAccessTokenFromLocalStorage } from "helpers";

export const getUserFavorites = async () => {
  const token = getAccessTokenFromLocalStorage();
  try {
    const result = await api.get("/favorites", {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    return result;
  } catch (err) {
    console.log(err);
  }
};

/**
 * @param {{
 * productId: number,
 * review: string,
 * rating: number
 * }} info
 * @param {} options
 */
export const addReview = async (info, options = {}) => {
  const token = getAccessTokenFromLocalStorage();

  try {
    const result = await api.post("/reviews", info, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
      ...options,
    });

    return result.data.data;
  } catch (err) {
    console.log({ err });
    alert(err.response.data.error);
  }
};

/**
 *
 * @param {{
 *  delivery: {
 *    address: {
 *     isValid: true
 *     additional: string,
 *     district: {value: number, text: string}
 *     province: {value: number, text: string}
 *     ward: {value: number, text: string}
 * },
 * checked: {"ship-p": string},
 * email: string,
 * name: {firstName: string, lastName: string}
 * phone: string
 * },
 * payment: {
 *  data: {
 *    cvc: string,
 *    expiry: string,
 *    issuer: string,
 *    name: string,
 *    number: string
 *  }
 * },
 * products: {
 *  products: {
 *    added: {
 *     colorId: string
 *     quantity: number
 *     size: string
 *    }
 *    products: [],
 *    shipping: number,
 *    subtotal: number,
 *    tax: number
 *  }[]
 * }
 * }} info
 */
export const orderProducts = async (info) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    const a = info.delivery.address;
    const address = `${a.additional}, ${a.ward?.text || a.ward}, ${
      a.district?.text || a.district
    }, ${a.province?.text || a.province}`;

    const response = await api.post(
      "/orders",
      {
        receiver:
          info.delivery.name.firstName + " " + info.delivery.name.lastName,
        address,
        email: info.delivery.email,
        phone: info.delivery.phone,
        products: info.products.products,
      },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      }
    );

    return response.data;
  } catch (err) {
    console.log(err);
  }
};

export const getMyOrders = async (options = {}) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    const response = await api.get("/orders", {
      headers: {
        Authorization: `Bearer ${token}`,
      },
      ...options,
    });

    return response.data.data.orders;
  } catch (err) {
    console.log(err);
  }
};

export const changePassword = async (body, options = {}) => {
  try {
    const token = getAccessTokenFromLocalStorage();

    const response = await api.post(
      "/users/change_password",
      {
        newPassword: body.newPassword,
        oldPassword: body.oldPassword,
      },
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
        ...options,
      }
    );

    return response;
  } catch (err) {
    console.log(err);
    return err;
  }
};
