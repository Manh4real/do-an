import axios from "axios";
import { geoApi, zipcodeApi } from "api";

/*
geolocation (of IP address):
{
  "ip": "54.246.228.58",
  "hostname": "ec2-54-246-228-58.eu-west-1.compute.amazonaws.com",
  "city": "Dublin",
  "region": "Leinster",
  "country": "IE",
  "loc": "53.3331,-6.2489",
  "org": "AS16509 Amazon.com, Inc.",
  "postal": "D02",
  "timezone": "Europe/Dublin"
}

zipcode:
{
	"ip": "42.116.242.94",
	"city": "Hanoi",
	"region": "Hanoi",
	"country": "VN",
	"loc": "21.0245,105.8412",
	"org": "AS18403 FPT Telecom Company",
	"postal": "10000",
	"timezone": "Asia/Bangkok"
}
*/

export const getUserGeolocation = async (code, options = {}) => {
  const geolocationResult = await geoApi.get("/", {
    params: {
      token: process.env.REACT_APP_GEOLOCATION_API_TOKEN,
    },
    ...options,
  });
  const geolocation = geolocationResult.data;

  let zipcodeData = {};
  if (code) {
    const zipcodeResult = await zipcodeApi.get("/", {
      params: {
        apikey: process.env.REACT_APP_ZIPCODE_API_KEY,
        codes: code,
        country: geolocation.country,
      },
      ...options,
    });

    zipcodeData = zipcodeResult.data;
  }

  return {
    geolocation,
    zipcode_data: zipcodeData,
  };
};

// ADDRESS
export const getProvinceList = async (options) => {
  const response = await axios.get(
    process.env.REACT_APP_PROVINCES_API_ENDPOINT,
    {
      ...options,
    }
  );

  return response.data;
};
export const getDistrictList = async (options) => {
  const response = await axios.get(
    process.env.REACT_APP_DISTRICTS_API_ENDPOINT,
    {
      ...options,
    }
  );

  return response.data;
};
export const getWardList = async (options) => {
  const response = await axios.get(process.env.REACT_APP_WARDS_API_ENDPOINT, {
    ...options,
  });

  return response.data;
};
