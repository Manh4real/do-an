import React from "react";

import FilterIcon from "components/Icons/FilterIcon";

function ToggleFilterButton({ handleToggleFilter, isShowFilter, isTablet }) {
  return (
    <button
      className="show-hide-filter-btn showed"
      onClick={handleToggleFilter}
    >
      <span className="text">
        {isTablet ? "Filter" : !isShowFilter ? "Show Fitlers" : "Hide Filters"}
      </span>
      <FilterIcon />
    </button>
  );
}

export default ToggleFilterButton;
