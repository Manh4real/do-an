import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import countryList from "countries-list";
import { IUserFormData, IRole } from "../../types";
import Validation from "../../validation";

type CommonKeys = "first_name" | "last_name" | "email" | "birthday" | "role";
type Keys = CommonKeys | "country" | "avatar" | "user_id";
type IEditFormData = {
  [key in CommonKeys]: {
    value: string;
    isValid: boolean;
    resonseError?: string;
  };
} & {
  role: {
    value: IRole;
    isValid: true;
  };
  country: {
    value: keyof typeof countryList.countries;
    isValid: boolean;
  };
  avatar: {
    value: File | Blob | null;
    isValid: boolean;
  };
  user_id: {
    value: string;
    isValid: true;
  };
};

interface IStore {
  data: IEditFormData | null;
  isAllValid: () => boolean;
  updateData: (info: Partial<IEditFormData>) => void;
  reset: () => void;
  getAll: () => Omit<IUserFormData, "password"> | null;
  init: (
    data: Omit<IUserFormData, "password" | "avatar"> & { avatar: string }
  ) => void;
}

const useEditFormStore = create<IStore>()(
  immer((set, get) => ({
    data: null,
    isAllValid() {
      const currentData = get().data;
      if (currentData === null) return false;

      const keys = Object.keys(currentData);

      for (let i = 0; i < keys.length; i++) {
        const _key = keys[i] as Keys;

        let c = currentData[_key].isValid;

        if (c === false) return false;
      }

      return true;
    },
    init(
      data: Omit<IUserFormData, "password" | "avatar"> & { avatar: string }
    ) {
      const validation = new Validation();

      const entries = Object.entries(data).map(([key, value]) => {
        const _key = key as Keys;

        const _value = typeof value === "string" ? value.trim() : value;

        let c = true;

        if (typeof _value === "string") {
          switch (_key) {
            case "first_name":
              c = validation.validateName(_value).isValid;
              break;
            case "last_name":
              c = validation.validateName(_value).isValid;
              break;
            case "birthday":
              c = validation.validateBirthday(new Date(_value)).isValid;
              break;
            case "email":
              c = validation.validateEmail(_value).isValid;
              break;
          }
        }

        return [
          _key,
          {
            value: _value,
            isValid: c,
          },
        ];
      });
      const newData: IEditFormData = Object.fromEntries(entries);

      set((state) => ({
        ...state,
        data: newData,
      }));
    },
    getAll() {
      const currentData = get().data;
      if (currentData === null) return null;

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
        data: null,
      }));
    },
    updateData(info: Partial<IEditFormData>) {
      set((state) => {
        const o = !state.data ? {} : state.data;

        return {
          ...state,
          data: {
            ...o,
            ...info,
          },
        };
      });
    },
  }))
);

export { useEditFormStore };
