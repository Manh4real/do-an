import { SORT_PRICE_LOW_HIGH, SORT_PRICE_HIGH_LOW } from "./constants";

const sortPriceLowHigh = (payload) => {
  return { by: SORT_PRICE_LOW_HIGH, payload };
};

const sortPriceHighLow = (payload) => {
  return { by: SORT_PRICE_HIGH_LOW, payload };
};

export { sortPriceHighLow, sortPriceLowHigh };
