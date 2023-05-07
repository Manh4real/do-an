import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import { IProductTypeFormData } from "../../../types";
import Validation from "../../../validation";

type Keys = keyof IProductTypeFormData;
type IProductTypeEditFormData = {
  [key in Keys]: {
    value: string;
    isValid: boolean;
    resonseError?: string;
  };
};

// const initialValue = {
//   value: "",
//   isValid: false,
// };

// const initialData: IProductTypeEditFormData = {
//   type_id: initialValue,
//   type_name: initialValue,
// };

interface IStore {
  data: IProductTypeEditFormData | null;
  isAllValid: () => boolean;
  updateData: (info: Partial<IProductTypeEditFormData>) => void;
  reset: () => void;
  getAll: () => IProductTypeFormData | null;
  init: (data: IProductTypeFormData) => void;
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
    init(data: IProductTypeFormData) {
      const validation = new Validation();

      const entries = Object.entries(data).map(([key, value]) => {
        const _key = key as Keys;

        const _value = typeof value === "string" ? value.trim() : value;

        let c = true;

        if (typeof _value === "string") {
          switch (_key) {
            case "type_id":
              c = validation.validateName(_value).isValid;
              break;
            case "type_name":
              c = validation.validateName(_value).isValid;
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
      const newData: IProductTypeEditFormData = Object.fromEntries(entries);

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
      const a: IProductTypeFormData = Object.fromEntries(entries);

      return a;
    },
    reset() {
      set((state) => ({
        ...state,
        data: null,
      }));
    },
    updateData(info: Partial<IProductTypeEditFormData>) {
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
