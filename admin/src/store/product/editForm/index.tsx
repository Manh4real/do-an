import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import {
  IProduct,
  IProductEditFormData as IProductEditForm,
} from "../../../types";
import Validation from "../../../validation";

type Keys = keyof IProductEditForm;
export type IProductEditFormData = {
  [key in Keys]: {
    value: IProductEditForm[key];
    isValid: boolean;
    resonseError?: string;
  };
};

interface IStore {
  data: IProductEditFormData | null;
  isAllValid: () => boolean;
  updateData: (info: Partial<IProductEditFormData>) => void;
  reset: () => void;
  getAll: () => IProductEditForm | null;
  init: (
    data: Omit<IProductEditForm, "images"> & { images: IProduct["images"] }
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
      data: Omit<IProductEditForm, "images"> & { images: IProduct["images"] }
    ) {
      const validation = new Validation();

      const entries = Object.entries(data).map(([key, value]) => {
        const _key = key as Keys;

        const _value = typeof value === "string" ? value.trim() : value;

        let c = true;

        if (typeof _value === "string") {
          switch (_key) {
            case "product_name":
              c = validation.validateProductName(_value).isValid;
              break;
            case "category":
              c = validation.validateCategory(_value).isValid;
              break;
            case "description":
              c = validation.validateDescription(_value.slice(0, 10)).isValid;
              break;
            case "target":
              c = validation.validateTarget(_value).isValid;
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
      const newData: IProductEditFormData = Object.fromEntries(entries);

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
      const a: IProductEditForm = Object.fromEntries(entries);

      return a;
    },
    reset() {
      set((state) => ({
        ...state,
        data: null,
      }));
    },
    updateData(info: Partial<IProductEditFormData>) {
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
