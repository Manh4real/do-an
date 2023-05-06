import { createAsyncThunk, createSlice, nanoid } from "@reduxjs/toolkit";
import api, { auth } from "api";
import { useSelector } from "react-redux";

import {
  deleteUserAvatar,
  getDownloadUserAvatar,
  uploadUserAvatar,
} from "features/firebase";
import {
  getAccessTokenFromLocalStorage,
  setAccessTokenAtLocalStorage,
} from "helpers";
import { DEFAULT_AVATAR } from "../../constants";

const initialState = {
  status: "idle",
  error: null,
  data: {},
};

export const fetchUser = createAsyncThunk("user/fetchUser", async function () {
  const accessToken = getAccessTokenFromLocalStorage();

  if (accessToken) {
    let user;
    try {
      const result = await api.get("/me", {
        headers: {
          Authorization: `Bearer ${accessToken}`,
        },
      });
      user = result.data.data.user;

      try {
        const avatarUrl = await getDownloadUserAvatar(user.avatar);

        user.avatar = avatarUrl || user.avatar;
      } catch (err) {
        console.log(err);
      }
    } catch (err) {
      console.log("Fetch user error: ", err.message);
      user = null;
    }

    return user;
  } else {
    return null;
  }
});
export const signIn = createAsyncThunk(
  "user/signIn",
  async function (partialPayload) {
    const { email, password } = partialPayload;

    try {
      const response = await auth.post("/signin", { email, password });
      const { accessToken } = response.data;

      const result = await api.get("/me", {
        headers: {
          Authorization: `Bearer ${accessToken}`,
        },
      });

      const user = result.data.data.user;
      setAccessTokenAtLocalStorage(accessToken);

      try {
        const avatarUrl = await getDownloadUserAvatar(user.avatar);

        user.avatar = avatarUrl;
      } catch (err) {
        console.log(err);
      }

      return user;
    } catch (err) {
      alert(err.response.data?.message || err.message);
    }
  }
);

export const signUp = createAsyncThunk(
  "user/signUp",
  async function (partialPayload) {
    try {
      const newUser = {
        email: partialPayload.email,
        password: partialPayload.password,
        first_name: partialPayload.name.firstName,
        last_name: partialPayload.name.lastName,
        birthday: partialPayload.birthday,
        country: partialPayload.country,
        with_email: partialPayload.withEmail,
        registration_time: Date.now(),
      };
      const response = await auth.post("/signup", newUser);
      const { accessToken } = response.data;
      const result = await api.get("/me", {
        headers: {
          Authorization: `Bearer ${accessToken}`,
        },
      });

      const user = result.data.data.user;
      setAccessTokenAtLocalStorage(accessToken);

      try {
        const avatarUrl = await getDownloadUserAvatar(user.avatar);

        user.avatar = avatarUrl;
      } catch (err) {
        console.log(err);
      }

      return user;
    } catch (err) {
      alert("Email already exists!");
    }
  }
);

export const updateUser = createAsyncThunk(
  "user/updateInfo",
  async (payload, thunkAPI) => {
    const token = getAccessTokenFromLocalStorage();

    if (!token) return;

    const {
      name: { firstName, lastName },
      avatar,
      email,
    } = payload;

    const body = {
      first_name: firstName,
      last_name: lastName,
      avatar,
      email,
    };

    let avatarUrl = avatar;

    if (!(avatar instanceof File) && !(avatar instanceof Blob)) {
      delete body.avatar;
    } else {
      const fileName = nanoid();
      avatarUrl = await uploadUserAvatar(avatar, fileName);

      body.avatar = fileName;

      // delete old avatar first
      try {
        const response = await api.get("/users/avatar", {
          headers: {
            Authorization: `Bearer ${token}`,
          },
        });

        const userAvatar = response.data.data.user_avatar;

        if (DEFAULT_AVATAR !== userAvatar) {
          await deleteUserAvatar(userAvatar).catch((err) => {
            console.log(err);
          });
        }
      } catch (err) {
        console.log(err);
      }
    }

    // update new avatar later
    const response = await api.put("me", body, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });

    return {
      name: {
        firstName: response.data.data.user.first_name,
        lastName: response.data.data.user.last_name,
      },
      avatar: avatarUrl,
      email: response.data.data.user.email,
      registration_time: response.data.data.user.registration_time,
    };
  }
);

export const fetchFavorites = createAsyncThunk(
  "user/favorites",
  async (payload, thunkAPI) => {
    const token = getAccessTokenFromLocalStorage();

    if (token) {
      const result = await api.get("/favorites", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      return result.data.data.favorites;
    }
  }
);

export const addFavorite = createAsyncThunk(
  "user/addToFavorites",
  async (payload, thunkAPI) => {
    const token = getAccessTokenFromLocalStorage();

    const info = {
      productId: payload.productId,
      colorId: payload.colorId,
      size: payload.size,
      sizeId: payload.sizeId,
    };

    try {
      const result = await api.post("/favorites", info, {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      return result.data.data.favorite;
    } catch (err) {
      console.log(err);
    }
  }
);

export const removeFromFavorites = createAsyncThunk(
  "user/removeFromFavorites",
  async (payload, thunkAPI) => {
    const token = getAccessTokenFromLocalStorage();
    const items = payload.map((p) => {
      return {
        product_id: p.product_id,
        colorId: p.added.colorId,
      };
    });

    try {
      await api.delete("/favorites", {
        headers: {
          Authorization: `Bearer ${token}`,
        },
        data: {
          items,
        },
      });

      // return result.data.data.favorite;
      return true;
    } catch (err) {
      console.log(err);
    }
  }
);

const userSlice = createSlice({
  name: "user",
  initialState,
  reducers: {
    initUser: (state, action) => {
      state.data.name = action.payload.name;
      state.data.bag = action.payload.bag;
      state.data.favorites = action.payload.favorites;
      state.data.registrationTime = action.payload.registrationTime;
    },
    logOut: (state) => {
      state.data = {};
      setAccessTokenAtLocalStorage(null);
    },
    updateFavorites: {
      reducer: (state, action) => {
        const addedFavorite = action.payload;
        const c = state.data.favorites.some(
          (p) => p.product_id === addedFavorite.product_id
        );

        if (c) {
          alert("Product have been saved to Favorites. (Redux)");
          return state;
        }

        state.data.favorites = [addedFavorite, ...state.data.favorites];
        alert("Added to Favorites. (Redux)");
      },
      // prepare: (payload) => {
      //   // payload.added.favoriteId = nanoid();
      //   // return { payload };
      //   return {
      //     payload: {
      //       ...payload,
      //       added: {
      //         colorId: payload.added.colorId,
      //         size: payload.added.size,
      //       },
      //     },
      //   };
      // },
    },
    removeFavorites: (state, action) => {
      alert("Removed favorites. (Redux)");

      const removedItems = action.payload;

      state.data.favorites = state.data.favorites.filter((p) => {
        for (let i = 0; i < removedItems.length; i++) {
          if (
            removedItems[i].product_id === p.product_id &&
            removedItems[i].added.colorId === p.added.colorId
          ) {
            return false;
          }
        }

        return true;
      });
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchUser.pending, (state) => {
        state.status = "loading";
      })
      .addCase(fetchUser.fulfilled, (state, action) => {
        if (!action.payload) {
          state.status = "error";
        } else {
          state.status = "succeeded";
          updateInfo(state, action);
        }
      })
      .addCase(fetchUser.rejected, (state, action) => {
        state.status = "error";
        state.error = action.error;
      })
      .addCase(updateUser.fulfilled, (state, action) => {
        if (!action.payload) {
          state.status = "error";
        } else {
          state.status = "succeeded";
          // state.data = action.payload;
          updateInfo(state, action);
        }
      })
      .addCase(updateUser.rejected, (state, action) => {
        state.status = "error";
        state.error = action.error;
      })
      .addCase(signIn.fulfilled, (state, action) => {
        state.status = "succeeded";
        updateInfo(state, action);
      })
      .addCase(signIn.rejected, (state, action) => {
        state.status = "error";
      })
      .addCase(signUp.fulfilled, (state, action) => {
        state.status = "succeeded";
        updateInfo(state, action);
      })
      .addCase(signUp.rejected, (state) => {
        // alert("Failed to sign up!");
        state.status = "error";
      })
      .addCase(fetchFavorites.fulfilled, (state, action) => {
        if (action.payload) {
          state.data.favorites = action.payload;
        }
      })
      .addCase(fetchFavorites.rejected, (state, action) => {
        console.log("fetch favorites rejected");
      });
  },
});

const updateInfo = (state, action) => {
  // const user = action.payload.data.user;
  const user = action.payload;

  if (!user) return state;

  state.data = {
    name: user.name,
    avatar: user.avatar?.trim(),
    email: user.email?.trim(),
    password: user.password?.trim(),
    country: user.country?.trim(),
    bag: user.bag || [],
    favorites: state.data.favorites || [],
    registration_time: Number(user.registration_time),
  };
};

export const selectFavorites = (state) => state.user.data.favorites;
export const selectUserName = (state) => state.user.data.name;
export const selectUser = (state) => state.user.data;
export const selectUserAll = (state) => state.user;
export const selectUserStatus = (state) => state.user.status;
export const useIsLoggedIn = () => {
  const user = useSelector(selectUser);
  return Object.keys(user).length > 0;
};
export const useUser = () => {
  return useSelector(selectUser);
};
export const useUserStatusLoading = () => {
  const userStatus = useSelector(selectUserStatus);
  return userStatus === "loading";
};
export const { updateFavorites, removeFavorites, initUser, logOut } =
  userSlice.actions;

export default userSlice.reducer;
