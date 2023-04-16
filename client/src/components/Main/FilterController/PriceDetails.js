import React, { useState } from "react";
import clsx from "clsx";

// import ExpandingButton from "./ExpandingButton";
import { DetailsTag } from "components/DetailsTag";

import styles from "./PriceDetails.module.css";
import { useSearchParams } from "react-router-dom";

function PriceDetails() {
  const [searchParams, setSearchParams] = useSearchParams();
  const [priceRange, setPriceRange] = useState({
    from: searchParams.get("minPrice") || "",
    to: searchParams.get("maxPrice") || "",
  });
  const [error, setError] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();

    const range = {};

    if (priceRange.from !== "") range.minPrice = priceRange.from;
    if (priceRange.to !== "") range.maxPrice = priceRange.to;

    if (Object.keys(range).length > 0) {
      if (priceRange.from !== "" && priceRange.to !== "") {
        if (priceRange.from > priceRange.to) {
          setError("Please enter proper price range");
        } else {
          searchParams.delete("minPrice");
          searchParams.delete("maxPrice");

          setSearchParams({ ...Object.fromEntries(searchParams), ...range });
        }
        console.log(range);
      } else {
        setError("");
        searchParams.delete("minPrice");
        searchParams.delete("maxPrice");

        setSearchParams({ ...Object.fromEntries(searchParams), ...range });
      }
    }
  };

  return (
    <DetailsTag
      open
      summary="Shop by Price:"
      className={clsx("filter-ctg", styles["shop-by-price-ctn"])}
    >
      <form
        onSubmit={handleSubmit}
        className="flex-center flex-column gap-15 p-10"
      >
        <div className="flex-center gap-15">
          <div className="flex-1">
            <p>From</p>
            <input
              type="text"
              value={priceRange.from}
              onChange={(e) => {
                const value = e.target.value;

                const number = Number.parseFloat(value);

                if (value !== "" && Number.isNaN(number)) {
                  return;
                }
                if (value < 0) return;

                setError("");
                setPriceRange((prev) => {
                  return {
                    ...prev,
                    from: value === "" ? "" : Number.parseFloat(value),
                  };
                });
              }}
            />
          </div>
          <span className="line mt-25"></span>
          <div className="flex-1">
            <p>To</p>
            <input
              type="text"
              value={priceRange.to}
              onChange={(e) => {
                const value = e.target.value;

                const number = Number.parseFloat(value);

                if (value !== "" && Number.isNaN(number)) {
                  return;
                }
                if (value < 0) return;

                setError("");
                setPriceRange((prev) => {
                  return {
                    ...prev,
                    to: value === "" ? "" : Number.parseFloat(value),
                  };
                });
              }}
            />
          </div>
        </div>
        {error && <p className="red-font">{error}</p>}
        <button
          type="submit"
          className="big-medium-button w-100 font-14 mt-15 hover-w-fade"
        >
          Apply
        </button>
      </form>
    </DetailsTag>
  );
}

export default PriceDetails;
