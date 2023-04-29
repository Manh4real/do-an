import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import countryList from "countries-list";
import { IUserFormData, IRole } from "../../types";

type CommonKeys =
  | "first_name"
  | "last_name"
  | "email"
  | "password"
  | "birthday"
  | "role"
  | "manufacturer";
type Keys = CommonKeys | "country" | "avatar";
type IUserAddFormData = {
  [key in CommonKeys]: {
    value: string;
    isValid: boolean;
    resonseError?: string;
  };
} & {
  role: {
    value: IRole;
    isValid: boolean;
  };
  country: {
    value: keyof typeof countryList.countries;
    isValid: boolean;
  };
  avatar: {
    value: File | Blob | null;
    isValid: boolean;
  };
};

const initialValue = {
  value: "",
  isValid: false,
};

const EIGHTEEN_YEARS_TIME = 86400 * 1000 * 365 * 18;
const EIGHTEEN_YO_DOB_STRING = new Date(Date.now() - EIGHTEEN_YEARS_TIME)
  .toISOString()
  .slice(0, 10);
const initialData: IUserAddFormData = {
  first_name: initialValue,
  last_name: initialValue,
  birthday: {
    value: EIGHTEEN_YO_DOB_STRING,
    isValid: true,
  },
  country: {
    value: "VN",
    isValid: true,
  },
  email: initialValue,
  password: initialValue,
  role: {
    value: "1",
    isValid: true,
  },
  avatar: {
    value: null,
    isValid: true,
  },
  manufacturer: initialValue,
};

interface IStore {
  data: IUserAddFormData;
  isAllValid: () => boolean;
  updateData: (info: Partial<IUserAddFormData>) => void;
  reset: () => void;
  getAll: () => IUserFormData;
}

const useAddFormStore = create<IStore>()(
  immer((set, get) => ({
    data: initialData,
    isAllValid() {
      const currentData = get().data;
      const keys = Object.keys(currentData);

      for (let i = 0; i < keys.length; i++) {
        const _key = keys[i] as Keys;

        let c = currentData[_key].isValid;

        if (c === false) return false;
      }

      return true;
    },
    getAll() {
      const currentData = get().data;

      const entries = Object.entries(currentData).map(([key, value]) => {
        const _key = key as Keys;

        return [_key, value.value];
      });
      const a: IUserFormData = Object.fromEntries(entries);

      return a;
    },
    reset() {
      set((state) => ({
        ...state,
        data: initialData,
      }));
    },
    updateData(info: Partial<IUserAddFormData>) {
      set((state) => ({
        ...state,
        data: {
          ...state.data,
          ...info,
        },
      }));
    },
  }))
);

export { useAddFormStore };
