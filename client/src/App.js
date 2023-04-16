import React, { useEffect } from "react";
import { Outlet } from "react-router-dom";
import "react-loader-spinner/dist/loader/css/react-spinner-loader.css";

import "./App.css";

// Redux-related
import { useDispatch, useSelector } from "react-redux";
import { fetchBag, selectAllBaggedItems } from "features/bag/bagSlice";
import { fetchUser, fetchFavorites } from "features/user/userSlice";

import GlobalStyles from "components/GlobalStyles";

function App() {
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchBag());
    dispatch(fetchUser());
    dispatch(fetchFavorites());
  }, [dispatch]);

  return (
    <GlobalStyles>
      <Outlet />
    </GlobalStyles>
  );
}

export const useBag = () => {
  const bag = useSelector(selectAllBaggedItems);

  return bag;
};

export default App;
