import React, { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import clsx from "clsx";

import "./SortButton.css";
import { ArrowIcon } from "components/Icons";

// import { useFilterContext } from "../FilterController/context";

function SortButton() {
  const [searchParams] = useSearchParams();
  const [expanded, setExpanded] = useState(false);
  const [select, setSelect] = useState("");

  useEffect(() => {
    const sort = searchParams.get("sort");
    if (!sort) return;

    switch (sort) {
      case "priceAsc":
        setSelect("Price: Low-High");
        break;
      case "priceDesc":
        setSelect("Price: High-Low");
        break;
      case "newest":
        setSelect("Newest");
        break;
      case "featured":
        setSelect("Featured");
        break;
      default:
        // setSelect("");
        throw new Error("Error in Sort by");
    }
  }, [searchParams]);

  const handleClick = () => {
    setExpanded((prev) => !prev);
  };

  return (
    <div
      className={clsx("sort-by-btn", { expanded: expanded })}
      onClick={handleClick}
    >
      <div>
        Sort by
        <span className="sort__selected-cont">{select && `: ${select}`}</span>
      </div>

      <ArrowIcon initial="down" toggle={expanded} />
      <Content selected={select} setSelect={setSelect} />
    </div>
  );
}

const Content = (props) => {
  return (
    <div className="sort__content-dropdown">
      <SubContent content="Featured" sort="featured" {...props} />
      <SubContent content="Newest" sort="newest" {...props} />
      <SubContent content="Price: High-Low" sort="priceDesc" {...props} />
      <SubContent content="Price: Low-High" sort="priceAsc" {...props} />
    </div>
  );
};

const SubContent = ({ content, sort, selected, setSelect }) => {
  const [searchParams, setSearchParams] = useSearchParams();
  // const { filterProductsFunc } = useFilterContext();

  const handleClick = () => {
    setSearchParams(
      { ...Object.fromEntries(searchParams), sort },
      { replace: true }
    );

    setSelect(content);
    // filterProductsFunc({ ...Object.fromEntries(searchParams), sort });
  };

  return (
    <div
      className={clsx({ selected: selected === content })}
      onClick={handleClick}
    >
      {content}
    </div>
  );
};

export default SortButton;
