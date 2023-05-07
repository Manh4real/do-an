import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import { IProductTypeFormData } from "../../../types";

type Keys = Exclude<keyof IProductTypeFormData, "type_id">;
type IProductTypeAddFormData = {
  [key in Keys]: {
    value: string;
    isValid: boolean;
    resonseError?: string;
  };
};

const initialValue = {
  value: "",
  isValid: false,
};

const initialData: IProductTypeAddFormData = {
  // type_id: initialValue,
  type_name: initialValue,
};

interface IStore {
  data: IProductTypeAddFormData;
  isAllValid: () => boolean;
  updateData: (info: Partial<IProductTypeAddFormData>) => void;
  reset: () => void;
  getAll: () => IProductTypeFormData;
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
      const a: IProductTypeFormData = Object.fromEntries(entries);

      return a;
    },
    reset() {
      set((state) => ({
        ...state,
        data: initialData,
      }));
    },
    updateData(info: Partial<IProductTypeAddFormData>) {
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
