import React, { Fragment } from "react";

import { EmptyFavoritesMes } from "routes/Cart/BagFavorites";
import FavoriteItem from "./FavoriteItem";
import EditButton from "./EditButton";

// Redux-related
import { selectFavorites } from "features/user/userSlice";
import { useSelector } from "react-redux";

const FavoriteItems = () => {
  const favorites = useSelector(selectFavorites);

  return (
    (favorites.length && (
      <Fragment>
        <EditButton />
        {favorites.map((fv) => (
          <FavoriteItem key={fv.product_id + fv.added.colorId} item={fv} />
        ))}
      </Fragment>
    )) || (
      <EmptyFavoritesMes className="text-center grid-col-span-3 align-middle" />
    )
  );
};

export default FavoriteItems;
