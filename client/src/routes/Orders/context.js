import React, { useContext } from "react";

export const RefreshContext = React.createContext({ handleRefresh: () => {} });

export const useRefreshCotnext = () => {
  return useContext(RefreshContext);
};
