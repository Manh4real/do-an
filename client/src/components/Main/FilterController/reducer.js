import { SET_GENDER, SET_PRICE } from "./constants";

export const reducer = (state, action) => {
  switch (action.filter) {
    // case SET_TYPE:
    //   return {
    //     ...state,
    //     type: action.payload,
    //   };
    case SET_GENDER:
      return {
        ...state,
        gender: action.payload,
      };
    case SET_PRICE:
      return {
        ...state,
        price: action.payload,
      };
    default:
      console.log("default");
  }
};
