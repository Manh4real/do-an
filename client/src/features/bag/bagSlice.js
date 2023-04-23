import {
  createSlice,
  // createEntityAdapter,
  createAsyncThunk,
  nanoid,
} from "@reduxjs/toolkit";

import {
  clearBagFromLocalStorage,
  getBagFromLocalStorage,
  modifyBagAtLocalStorage,
  removeFromBagLocalStorage,
  setBagAtLocalStorage,
} from "helpers";
import { getProductsByIds } from "services/products";

// import { MAXIMUM_QUANTITY } from "../../constants";

/*
  {
    id: 1,
    added: {
      baggedId: "X8Eh23FAvQQ__wzBqCiIl",
      size: {
        size_id: "6",
        size: "6",
        size_type_id: 1
      },
      colorId: 6,
      quantity: 1
    }
  }

*/

const fetchBag = createAsyncThunk("bag/fetchBag", async function () {
  const savedBag = getBagFromLocalStorage();

  if (!savedBag) return [];

  const productsIds = Array.from(
    new Set(
      savedBag.filter((p) => p.product_id).map((p) => p.product_id.toString())
    )
  );
  const products = await getProductsByIds(productsIds.join(","));

  const bag = savedBag
    .filter((p) => p.product_id)
    .map((p1) => {
      const product = products.find((p2) => {
        return p2.product_id.toString() === p1.product_id.toString();
      });

      return {
        ...product,
        added: { ...p1.added },
      };
    });

  return bag;
});

const initialState = {
  status: "idle",
  error: null,
  data: [],
};

const bagSlice = createSlice({
  name: "bag",
  initialState,
  reducers: {
    addToBag: {
      reducer: (state, action) => {
        const { colorId, size } = action.payload.added;
        const productId = action.payload.product_id;

        const addedProduct = state.data.find(
          (p) =>
            p.product_id === productId &&
            p.added.colorId === colorId &&
            p.added.size.size_id === size.size_id
        );

        if (addedProduct) {
          const remainingQty =
            addedProduct.stock[colorId].find(
              (stock) => stock.size_id === size.size_id
            )?.quantity || 0;
          console.log("Stock: ", remainingQty);

          if (addedProduct.added.quantity < remainingQty)
            addedProduct.added.quantity++;
          else {
            alert(`Exceeded required quantity!\n(Max: ${remainingQty})`);
          }
        } else {
          alert("Added to your Bag.");
          state.data.push(action.payload);
          setBagAtLocalStorage(action.payload);
        }
      },
      prepare: (payload) => {
        return {
          payload: {
            ...payload,
            added: {
              ...payload.added,
              baggedId: nanoid(),
            },
          },
        };
      },
    },
    removeFromBag: (state, action) => {
      const baggedId = action.payload;

      state.data = state.data.filter((p) => p.added.baggedId !== baggedId);

      removeFromBagLocalStorage(baggedId);
    },
    modifyFromBag: (state, action) => {
      const { baggedId, modifiedType, modifiedValue } = action.payload;
      const modifiedProduct = state.data.find(
        (p) => p.added.baggedId === baggedId
      );

      if (!modifiedProduct) return state;
      modifiedProduct.added[modifiedType] = modifiedValue;

      modifyBagAtLocalStorage(action.payload);
    },
    clearBag(state) {
      clearBagFromLocalStorage();
      state.data = [];

      return state;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchBag.pending, (state) => {
        state.status = "loading";
      })
      .addCase(fetchBag.fulfilled, (state, action) => {
        state.status = "succeeded";
        state.data = action.payload;
      })
      .addCase(fetchBag.rejected, (state, action) => {
        state.status = "error";
        state.error = action.error;
      });
  },
});

export { fetchBag };
export const { addToBag, removeFromBag, modifyFromBag, clearBag } =
  bagSlice.actions;

export const selectAllBaggedItems = (state) => state.bag.data;

export default bagSlice.reducer;
