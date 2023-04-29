import React, { useContext } from "react";

interface IRefreshContextValue {
  refresh: boolean;
  handleRefresh: () => void;
}
interface Props {
  value: IRefreshContextValue;
  children: React.ReactNode;
}
const RefreshContext = React.createContext<IRefreshContextValue>({
  refresh: false,
  handleRefresh: () => {},
});

export const RefreshContextProvider = ({ value, children }: Props) => {
  return (
    <RefreshContext.Provider value={value}>{children}</RefreshContext.Provider>
  );
};
export const useRefreshContext = () => useContext(RefreshContext);
