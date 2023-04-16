import React from "react";
import clsx from "clsx";

function SizeInputs({
  selectedSizeId,
  sizes: availableSizes,
  isError,
  handleError,
  handleSizeChange,
}) {
  const handleChange = (id) => {
    handleError();
    handleSizeChange(id);
  };

  const sizes = Number.isNaN(parseFloat(availableSizes[0]))
    ? SIZES.cloth
    : SIZES.shoes;

  return (
    <div
      className={clsx("sizes-wrapper", {
        alert: isError,
      })}
    >
      <div className="sizes-ctn">
        {sizes.map((s) => (
          <SizeInput
            key={s}
            sizes={availableSizes}
            s={s}
            selectedSizeId={selectedSizeId}
            checkWith={handleChange}
          />
        ))}
      </div>

      {isError && <AlertMessage />}
    </div>
  );
}

const SizeInput = ({ sizes, s, selectedSizeId, checkWith }) => {
  const handleChange = () => {
    checkWith(s);
  };

  return (
    <div>
      <input
        type="radio"
        name="size"
        id={"size-" + s}
        data-size={s}
        value={s}
        disabled={!sizes.includes(s)}
        onChange={handleChange}
        checked={selectedSizeId === s}
      />
      <label className="sz regular-font" htmlFor={"size-" + s}>
        {s}
      </label>
    </div>
  );
};

const AlertMessage = () => {
  return (
    <div className="alert-mes regular-font red-font">Please select a size.</div>
  );
};

export const SIZES = {
  cloth: ["XS", "S", "M", "L", "XL", "2XL", "3XL", "4XL"],
  shoes: [
    "4",
    "4.5",
    "5",
    "5.5",
    "6",
    "6.5",
    "7",
    "7.5",
    "8",
    "8.5",
    "9",
    "9.5",
    "10",
    "10.5",
    "11",
    "11.5",
    "12",
    "12.5",
    "13",
    "13.5",
    "14",
    "14.5",
    "15",
  ],
};

export default SizeInputs;
