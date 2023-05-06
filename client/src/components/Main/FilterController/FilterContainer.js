import React, { useContext, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import clsx from "clsx";

// import styles from "./FilterContainer.module.css";

import FilterContext from "./context";
import PriceDetails from "./PriceDetails";
import ClothingDetails from "./ClothingDetails";
import GenderDetails from "./GenderDetails";
// import { DetailsTag } from "components/DetailsTag";
import { CloseIcon } from "components/Icons";

import StyledFilterContainer from "./StyledFilterContainer";
import ReviewFilter from "./RatingDetails";
// const MOBILE_WIDTH = 900;

function FilterContainer({ isShowFilter, isTablet, handleToggleFilter }) {
  const [searchParams, setSearchParams] = useSearchParams();
  const { dispatch } = useContext(FilterContext);

  const handleClick = (action) => {
    dispatch(action);
  };
  const handleFilterChange = (filter) => {
    console.log(filter);
    setSearchParams(
      { ...Object.fromEntries(searchParams), ...filter },
      { replace: true }
    );
  };
  const isTabletShown = !isShowFilter && isTablet;

  useEffect(() => {
    document.querySelector("body").style.overflow = isTabletShown
      ? "hidden"
      : "initial";
  }, [isTabletShown]);

  return (
    <StyledFilterContainer>
      <div
        className={clsx("filter-container", {
          "desktop--hide": !isShowFilter && !isTablet,
          "tablet--show": isTabletShown,
          "is--tablet": isTablet,
        })}
      >
        <ClothingDetails handleClick={handleClick} />
        {/* <FilterByStore /> */}
        <GenderDetails handleClick={handleFilterChange} />
        <ReviewFilter />
        <PriceDetails />

        <button
          className="filter-close-btn flex-center hover-w-fade"
          onClick={handleToggleFilter}
        >
          <CloseIcon w={12} h={12} />
        </button>
      </div>
    </StyledFilterContainer>
  );
}

// const FilterByStore = () => {
//   return (
//     <DetailsTag
//       summary="Pick Up Today At:"
//       open={true}
//       className="filter-ctg text-left"
//     >
//       <div className="filter-by-store">Filter by Store</div>
//     </DetailsTag>
//   );
// };

export default React.memo(FilterContainer);
