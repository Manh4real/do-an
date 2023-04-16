import React, { useState, useCallback, useReducer, useEffect } from "react";

import RelatedTopicsContainer from "./RelatedTopicsContainer";
import { FilterController } from "./FilterController/";

import reducer, { initialState } from "./reducer";

import "./Main.css";

const TABLE_WIDTH = 1450;

function Main() {
  const [showFilter, setShowFilter] = useState(true);
  const [sort, dispatch] = useReducer(reducer, initialState);

  // FOR TABLET OR SMALLER DEVICE
  const [isTablet, setIsTablet] = useState(window.innerWidth <= TABLE_WIDTH);

  useEffect(() => {
    const handleResize = () => setIsTablet(window.innerWidth <= TABLE_WIDTH);
    window.addEventListener("resize", handleResize);
    return () => window.removeEventListener("resize", handleResize);
  }, []);
  // ============================

  const handleSortTypeChange = (action) => {
    dispatch(action);
    console.log("Sort:", action);
  };

  const handleShowFilter = useCallback(() => {
    setShowFilter((prev) => !prev);
  }, []);

  return (
    <SortContext.Provider value={{ sort, handleSortTypeChange }}>
      <FilterController
        isShowFilter={showFilter}
        isTablet={isTablet}
        handleToggleFilter={handleShowFilter}
      />
      <RelatedTopicsContainer />
    </SortContext.Provider>
  );
}

const SortContext = React.createContext({});

export { SortContext };
export default Main;
