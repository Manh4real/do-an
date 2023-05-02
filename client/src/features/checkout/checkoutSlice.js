import { createSlice } from "@reduxjs/toolkit";
import { useSelector } from "react-redux";

const initialState = {
  products: null,
  delivery: null,
  payment: null,
};

const checkoutSlice = createSlice({
  name: "checkout",
  initialState,
  reducers: {
    updateDeliveryInfo(state, action) {
      if (action.payload) state.delivery = action.payload;
    },
    updatePaymentInfo(state, action) {
      if (action.payload) state.payment = action.payload;
    },
    updateProductsInfo(state, action) {
      if (action.payload) state.products = action.payload;
    },
  },
});

export const useCheckoutInfo = () => {
  return useSelector((state) => state.checkout);
};

export const { updateDeliveryInfo, updatePaymentInfo, updateProductsInfo } =
  checkoutSlice.actions;

export default checkoutSlice.reducer;
