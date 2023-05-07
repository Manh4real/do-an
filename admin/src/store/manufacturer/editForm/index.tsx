import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import { IManufacturerFormData } from "../../../types";
import Validation from "../../../validation";

type Keys = keyof IManufacturerFormData;
type IManufacturerEditFormData = {
  [key in Keys]: {
    value: string;
    isValid: boolean;
    resonseError?: string;
  };
};

interface IStore {
  data: IManufacturerEditFormData | null;
  isAllValid: () => boolean;
  updateData: (info: Partial<IManufacturerEditFormData>) => void;
  reset: () => void;
  getAll: () => IManufacturerFormData | null;
  init: (data: IManufacturerFormData) => void;
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
    init(data: IManufacturerFormData) {
      const validation = new Validation();

      const entries = Object.entries(data).map(([key, value]) => {
        const _key = key as Keys;

        const _value = typeof value === "string" ? value.trim() : value;

        let c = true;

        if (typeof _value === "string") {
          switch (_key) {
            case "manufacturer_name":
              c = validation.validateName(_value).isValid;
              break;
            case "brand_name":
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
      const newData: IManufacturerEditFormData = Object.fromEntries(entries);

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
      const a: IManufacturerFormData = Object.fromEntries(entries);

      return a;
    },
    reset() {
      set((state) => ({
        ...state,
        data: null,
      }));
    },
    updateData(info: Partial<IManufacturerEditFormData>) {
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
