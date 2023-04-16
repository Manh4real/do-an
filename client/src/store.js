import { configureStore } from "@reduxjs/toolkit";

import productsApi from "features/productsApi";
import userReducer from "features/user/userSlice";

import bagReducer from "./features/bag/bagSlice";
import checkoutReducer from "./features/checkout/checkoutSlice";

const store = configureStore({
  reducer: {
    bag: bagReducer,
    user: userReducer,
    checkout: checkoutReducer,
    [productsApi.reducerPath]: productsApi.reducer,
  },
  middleware: (getDefaultMiddleware) => {
    return getDefaultMiddleware().concat(productsApi.middleware);
  },
});

export default store;
