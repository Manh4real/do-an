import { create, StateCreator } from "zustand";
import { immer } from "zustand/middleware/immer";
import { getAccessTokenFromLocalStorage } from "../../helpers";
import { getMe } from "../../services/users";

import { IUser } from "../../types";

interface IUserStore {
  data: IUser | null;
  setUser: (user: IUser) => void;
  updateUser: (info: Partial<IUser>) => void;
  fetchUser: () => Promise<boolean>;
}

interface ILoginPayload {
  email: string;
  password: string;
}

// {
//     avatar: "default-avatar.png",
//     birthday: new Date().toDateString(),
//     country: "Vietnam",
//     email: "nguyenmanh@gmail.com",
//     first_name: "Manh",
//     last_name: "Nguyen",
//     registration_time: Date.now(),
//     role: "0",
//   }
const stateCreator: StateCreator<IUserStore> = (set) => ({
  data: null,
  async fetchUser() {
    const accessToken = getAccessTokenFromLocalStorage();
    if (accessToken) {
      const user = await getMe(accessToken);

      set((state) => {
        if (state.data) return state;

        return {
          ...state,
          data: user,
        };
      });

      return true;
    }

    return false;
  },
  setUser(user) {
    set((state) => ({ ...state, data: user }));
  },
  updateUser(info) {
    set((state) => ({
      ...state,
      data: state.data && { ...state.data, ...info },
    }));
  },
  async logIn({ email, password }: ILoginPayload) {},
});

const useUserStore = create<IUserStore>()(immer(stateCreator));

export { useUserStore };
