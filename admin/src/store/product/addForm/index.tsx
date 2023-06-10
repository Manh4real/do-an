import { create } from "zustand";
import { immer } from "zustand/middleware/immer";
import { IGender, IProductFormData } from "../../../types";

type Keys = Exclude<keyof IProductFormData, "old_price" | "manufacturer_name">;
type IProductAddFormData = {
  [key in Keys]: {
    value: IProductFormData[key];
    isValid: boolean;
    resonseError?: string;
  };
} & {
  gender: {
    value: IGender;
    isValid: true;
  };
  on_sale: {
    value: boolean;
    isValid: boolean;
  };
  colors: {
    value: string[];
    isValid: boolean;
  };
};

const initialValue = {
  value: "",
  isValid: false,
} as const;

// const EIGHTEEN_YEARS_TIME = 86400 * 1000 * 365 * 18;
// const EIGHTEEN_YO_DOB_STRING = new Date(Date.now() - EIGHTEEN_YEARS_TIME)
//   .toISOString()
//   .slice(0, 10);
const initialData: IProductAddFormData = {
  category: {
    isValid: true,
    value: "",
  },
  product_name: initialValue,
  type: {
    value: "",
    isValid: false,
  },
  gender: {
    value: "male",
    isValid: true,
  },
  target: initialValue,
  color_num: {
    value: 1,
    isValid: true,
  },
  price: {
    value: 100000,
    isValid: true,
  },
  on_sale: {
    value: false,
    isValid: true,
  },
  sizes: {
    value: [],
    isValid: true,
  },
  sales: {
    value: 0,
    isValid: true,
  },
  quantity: {
    value: 1,
    isValid: true,
  },
  description: initialValue,
  style_id: {
    value: "1",
    isValid: true,
  },
  type_id: {
    value: "",
    isValid: false,
  },
  images: {
    value: {},
    isValid: false,
  },
  stock: {
    value: {},
    isValid: false,
  },
  size_type_id: {
    value: "1",
    isValid: true,
  },
  colors: {
    value: ["1"],
    isValid: true,
  },
  manufacturer_id: {
    value: "",
    isValid: false,
  },
};

interface IStore {
  data: IProductAddFormData;
  isAllValid: () => boolean;
  updateData: (info: Partial<IProductAddFormData>) => void;
  reset: () => void;
  getAll: () => IProductFormData;
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
      const a: IProductFormData = Object.fromEntries(entries);

      return a;
    },
    reset() {
      set((state) => ({
        ...state,
        data: initialData,
      }));
    },
    updateData(info: Partial<IProductAddFormData>) {
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
