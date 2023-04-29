import React, { useState } from "react";

import { useAddFormStore } from "../../../store/product/addForm";

import "../_components/ColorInput.css";
import ImagesInput from "./ImagesInput";
import SizesInput from "./SizesInput";

function ColorInput() {
  const addFormStore = useAddFormStore();

  const [selectedColors, setSelectedColors] = useState<string[]>(
    addFormStore.data.colors.value
  );

  const handleChange: React.ChangeEventHandler<HTMLInputElement> = (e) => {
    let changed = [...selectedColors];
    const removedColors: string[] = [];

    if (e.target.checked) {
      changed.push(e.target.value);
    } else {
      changed = changed.filter((c) => {
        const check = c !== e.target.value;

        if (check) {
          removedColors.push(e.target.value);
        }

        return check;
      });
    }

    setSelectedColors(changed);

    let images = addFormStore.data.images.value;
    images = Object.fromEntries(
      Object.entries(images).filter(([colorId, arr]) => {
        return !removedColors.includes(colorId);
      })
    );

    addFormStore.updateData({
      colors: {
        value: changed,
        isValid: changed.length > 0,
      },
      color_num: {
        value: changed.length,
        isValid: true,
      },
      images: {
        value: images,
        isValid: Object.keys(images).length > 0,
      },
    });
  };

  const colorCodes = Object.entries(COLORS).map(([id, name]) => {
    switch (name) {
      case "red":
        return [id, "rgb(224 36 36 / 1)"];
      case "blue":
        return [id, "rgb(63 131 248 / 1)"];
      case "yellow":
        return [id, "rgb(250 202 21 / 1)"];
      case "black":
        return [id, "rgb(0 0 0 / 1)"];
      case "white":
        return [id, "rgb(255 255 255 / 1)"];
      case "gray":
        return [id, "rgb(156 163 175 / 1)"];
      case "pink":
        return [id, "rgb(231 70 148 / 1)"];
      case "dark blue":
        return [id, "rgb(35 56 118 / 1)"];
      default:
        return [id, name];
    }
  });

  return (
    <div className="sm:col-span-full">
      <div className="block text-sm font-medium leading-6 text-gray-900">
        Color of product
      </div>
      <div className="mt-2 flex items-center gap-3 justify-center flex-wrap">
        {colorCodes.map(([id, colorCode], index) => {
          return (
            <div key={index} className="flex items-center gap-x-3">
              <input
                id={"color-" + id}
                name="color"
                type="checkbox"
                value={id}
                checked={selectedColors.includes(id)}
                onChange={handleChange}
                className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
              />
              <label
                htmlFor={"color-" + id}
                className="ring-1 ring-gray-100 border-white border-2 rounded-md w-10 h-10 block text-sm leading-3 text-gray-900"
                style={{ backgroundColor: colorCode }}
              ></label>
            </div>
          );
        })}
      </div>

      {selectedColors.map((color) => {
        return (
          <React.Fragment key={color}>
            <ImagesInput key={color} color={COLORS[color]} colorId={color} />
            <SizesInput colorId={color} colorName={COLORS[color]} />
          </React.Fragment>
        );
      })}
    </div>
  );
}

export const COLORS: {
  [key: string]: string;
} = {
  1: "black",
  2: "blue",
  3: "red",
  4: "yellow",
  5: "white",
  6: "grey",
  7: "pink",
  8: "dark blue",
};

export default ColorInput;
