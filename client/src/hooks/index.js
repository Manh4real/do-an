import { useGetProductQuery } from "features/productsApi";
import { countryFromCountryCode } from "helpers";
import { useEffect, useState } from "react";

import { getUserGeolocation } from "services/location";

export const useUserCountry = () => {
  const [country, setCountry] = useState("");

  useEffect(() => {
    const controller = new AbortController();

    getUserGeolocation(null, { signal: controller.signal })
      .then((data) => {
        // const countryName = countryFromCountryCode(data.geolocation.country);
        setCountry(data.geolocation.country);
        // console.log(data.geolocation.country);
      })
      .catch((err) => {
        console.log(err);
      });

    return () => {
      controller.abort();
    };
  }, []);

  return {
    countryCode: country,
    countryName: country && countryFromCountryCode(country),
  };
};

export const useProduct = (productId) => {
  const response = useGetProductQuery(productId);
  return response;
};

export { default as useDownloadImage } from "./useDownloadImage";
