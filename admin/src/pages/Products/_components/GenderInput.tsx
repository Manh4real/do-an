import React from "react";

type IGender = "male" | "female" | "unisex";
interface Props {
  gender: IGender;
  handleChange: (gender: IGender) => void;
}
function GenderInput({ gender, handleChange }: Props) {
  return (
    <div className="sm:col-span-5">
      <div className="flex gap-5 text-sm leading-6 text-gray-900">
        <span className="font-medium">Gender:</span>
        <div className="flex items-center justify-center flex-1 gap-5">
          <div className="flex items-center gap-x-3">
            <input
              id="gender-m"
              name="gender"
              type="radio"
              checked={gender === "male"}
              onChange={() => {
                handleChange("male");
              }}
              className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
            />
            <label
              htmlFor="gender-m"
              className="block text-sm leading-3 text-gray-900"
            >
              Male
            </label>
          </div>
          <div className="flex items-center gap-x-3">
            <input
              id="gender-f"
              name="gender"
              type="radio"
              checked={gender === "female"}
              onChange={() => {
                handleChange("female");
              }}
              className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
            />
            <label
              htmlFor="gender-f"
              className="block text-sm leading-3 text-gray-900"
            >
              Female
            </label>
          </div>
          <div className="flex items-center gap-x-3">
            <input
              id="gender-u"
              name="gender"
              type="radio"
              checked={gender === "unisex"}
              onChange={() => {
                handleChange("unisex");
              }}
              className="h-4 w-4 border-gray-300 text-indigo-600 focus:ring-indigo-600"
            />
            <label
              htmlFor="gender-u"
              className="block text-sm leading-3 text-gray-900"
            >
              Unisex
            </label>
          </div>
        </div>
      </div>
    </div>
  );
}

export default GenderInput;
