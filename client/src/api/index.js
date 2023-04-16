import axios from "axios";

const api = axios.create({
  baseURL: process.env.REACT_APP_API_ENDPOINT,
});

export const auth = axios.create({
  baseURL: process.env.REACT_APP_AUTH_ENDPOINT,
});

export const geoApi = axios.create({
  baseURL: process.env.REACT_APP_GEOLOCATION_API_ENDPOINT,
});
export const zipcodeApi = axios.create({
  baseURL: process.env.REACT_APP_ZIPCODE_API_ENDPOINT,
});

export default api;
