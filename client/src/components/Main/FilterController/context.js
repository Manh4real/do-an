import React, { useContext } from "react";

const FilterContext = React.createContext({});
export const useFilterContext = () => useContext(FilterContext);

export default FilterContext;
