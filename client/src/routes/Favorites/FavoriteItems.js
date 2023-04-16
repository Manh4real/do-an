import React from "react";

import { EmptyFavoritesMes } from "routes/Cart/BagFavorites";
import FavoriteItem from "./FavoriteItem";

// Redux-related
import { selectFavorites } from "features/user/userSlice";
import { useSelector } from "react-redux";

const FavoriteItems = () => {
  const favorites = useSelector(selectFavorites);

  return (
    (favorites.length &&
      favorites.map((fv) => (
        <FavoriteItem key={fv.product_id + fv.added.colorId} item={fv} />
      ))) || <EmptyFavoritesMes className="text-center grid-col-span-3" />
  );
};

export default FavoriteItems;
