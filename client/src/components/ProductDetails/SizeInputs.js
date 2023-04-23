import React, { useEffect, useState } from "react";
import clsx from "clsx";
import { getSizes } from "services/misc";

function SizeInputs({
  selectedSizeId,
  sizes: availableSizes,
  isError,
  handleError,
  handleSizeChange,
}) {
  const [sizes, setSizes] = useState({});

  const handleChange = (size) => {
    handleError();
    handleSizeChange(size);
  };

  useEffect(() => {
    getSizes().then((data) => {
      setSizes(data);
    });
  }, []);

  const currentSizes = sizes[availableSizes[0].size_type_id] || [];

  return (
    <div
      className={clsx("sizes-wrapper", {
        alert: isError,
      })}
    >
      <div className="sizes-ctn">
        {currentSizes.map((size) => (
          <SizeInput
            key={size.color_id + size.size_id}
            sizes={availableSizes}
            size={size}
            selectedSizeId={selectedSizeId}
            checkWith={handleChange}
          />
        ))}
      </div>

      {isError && <AlertMessage />}
    </div>
  );
}

const SizeInput = ({ sizes, size, selectedSizeId, checkWith }) => {
  const handleChange = () => {
    checkWith(size);
  };

  return (
    <div>
      <input
        type="radio"
        name="size"
        id={"size-" + size.size_id}
        data-size={size.size_id}
        value={size.size_id}
        disabled={!sizes.some((s) => s.size_id === size.size_id)}
        onChange={handleChange}
        checked={selectedSizeId === size.size_id}
      />
      <label className="sz regular-font" htmlFor={"size-" + size.size_id}>
        {size.size}
      </label>
    </div>
  );
};

const AlertMessage = () => {
  return (
    <div className="alert-mes regular-font red-font">Please select a size.</div>
  );
};

// export const SIZES = {
//   cloth: ["XS", "S", "M", "L", "XL", "2XL", "3XL", "4XL"],
//   shoes: [
//     "4",
//     "4.5",
//     "5",
//     "5.5",
//     "6",
//     "6.5",
//     "7",
//     "7.5",
//     "8",
//     "8.5",
//     "9",
//     "9.5",
//     "10",
//     "10.5",
//     "11",
//     "11.5",
//     "12",
//     "12.5",
//   ],
// };

export default SizeInputs;
