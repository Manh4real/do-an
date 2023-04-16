import { SORT_PRICE_LOW_HIGH, SORT_PRICE_HIGH_LOW } from "./constants";

const initialState = { by: "" };
const reducer = (state, action) => {
  switch (action.by) {
    case SORT_PRICE_LOW_HIGH:
      return {
        ...state,
        by: action.by,
      };
    case SORT_PRICE_HIGH_LOW:
      return {
        ...state,
        by: action.by,
      };
    default:
      console.log(state.by);
      throw new Error("Check check I made a promise...");
  }
};

export { initialState };
export default reducer;
