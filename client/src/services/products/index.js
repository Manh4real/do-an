import { useEffect, useRef, useState } from "react";
import api from "api";
// import { useGetProductQuery } from "features/productsApi";

import { getDownloadImage } from "features/firebase";

export const useGetProductById = (productId) => {
  // const { data, isLoading } = useGetProductQuery(productId);
  const [finalProduct, setFinalProduct] = useState(null);
  const [loading, setLoading] = useState(false);

  const previousProductId = useRef(productId);

  useEffect(() => {
    setLoading(true);
    getProductById(productId)
      .then((data) => {
        setFinalProduct(data);
        previousProductId.current = productId;
      })
      .finally(() => {
        setLoading(false);
      });
  }, [productId]);

  useEffect(() => {
    if (!finalProduct) return;

    setLoading(true);

    let fullColorImages = finalProduct.images;
    const names = Object.keys(fullColorImages);
    const length = names.length;

    const _promises = [];

    for (let i = 0; i < length; i++) {
      const promises = [];
      const length2 = fullColorImages[names[i]].length;

      for (let j = 0; j < length2; j++) {
        // console.log(fullColorImages[names[i]][j]);
        promises.push(getDownloadImage(fullColorImages[names[i]][j].url));
      }

      _promises.push(
        Promise.all(promises).then((data) => {
          data.forEach((url, index) => {
            fullColorImages[names[i]][index].url = url;
          });
        })
      );
    }

    Promise.all(_promises)
      .then((data) => {
        // setFinalProduct(prev => {
        //   return {
        //     ...prev,
        //     images: fullColorImages
        //   }
        // })
      })
      .finally(() => {
        setLoading(false);
      });
  }, [finalProduct]);

  return {
    product: finalProduct,
    isLoading: loading || previousProductId.current !== productId,
  };
};

export const getProductById = async (id, options = {}) => {
  const response = await api.get("/products/" + id, { ...options });

  return response.data.data.product;
};

export const getProducts = async (page = 1, options = {}) => {
  const response = await api({
    method: "get",
    url: "/products",
    params: {
      page: page,
    },
    ...options,
  });

  let products = response.data.data.products;

  return products;
};

export const getProductsByIds = async (
  productsIds = "",
  page = 1,
  options = {}
) => {
  if (productsIds === "") {
    // console.log("No products in your bag");
    return;
  }

  const response = await api({
    method: "get",
    url: "/products/ids",
    params: {
      q: productsIds,
      page: page,
    },
    ...options,
  });

  let products = response.data.data.products;

  return products;
};

export const getLatestProducts = async (page = 1, options = {}) => {
  const response = await api({
    method: "get",
    url: "/products/latest",
    params: {
      page: page,
    },
    ...options,
  });

  let products = response.data.data.products;

  return products;
};

export const searchProductsByName = async (query, page = 1, options = {}) => {
  const response = await api({
    method: "get",
    url: "/search",
    params: {
      q: query,
      page,
    },
    ...options,
  });

  const products = response.data.data.products;

  return products;
};
