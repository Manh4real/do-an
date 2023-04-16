import React, { useEffect, useMemo, useState } from "react";
import clsx from "clsx";

import Spinner from "components/Spinner";
import BagFavoritesItem from "./BagFavoritesItem";
import ViewMoreButton from "./ViewMoreButton";

// Redux-related
import { useSelector } from "react-redux";
import { selectFavorites, useIsLoggedIn } from "features/user/userSlice";

function BagFavorites() {
  const [more, setMore] = useState(false);
  const [loading, setLoading] = useState(true);

  const favorites = useSelector(selectFavorites);
  const isLoggedIn = useIsLoggedIn();

  useEffect(() => {
    const timeID = setTimeout(() => setLoading(false), 3000);

    return () => clearTimeout(timeID);
  }, []);

  const output = useMemo(() => {
    const result =
      favorites?.map((p, i) => <BagFavoritesItem key={i} product={p} />) || [];

    if (more) return result;
    return result.slice(0, 2);
  }, [more, favorites]);

  const handleClick = () => {
    setMore((prev) => !prev);
  };

  return (
    <div className="bag__favorites">
      <div className="title medium-font">Favorites</div>
      <div className="bag__favorite-items flex-start">
        {!isLoggedIn ? (
          <QuestionMessage />
        ) : loading ? (
          <BFSpinner />
        ) : favorites.length ? (
          output
        ) : (
          <EmptyFavoritesMes />
        )}
      </div>
      {!loading && isLoggedIn && favorites.length > 2 && (
        <React.Fragment>
          <ViewMoreButton handleClick={handleClick}>
            {more ? "less" : "more"}
          </ViewMoreButton>
          {more && (
            <a
              href="/favorites"
              className="view-all underlined grey-font small-font"
            >
              View all
            </a>
          )}
        </React.Fragment>
      )}
    </div>
  );
}

const BFSpinner = () => {
  return (
    <div className="spinner">
      <Spinner />
    </div>
  );
};

export const EmptyFavoritesMes = ({ className }) => {
  return (
    <p
      className={clsx("regular-font", "grey-font", className)}
      style={{ padding: "30px 0" }}
    >
      There is no items saved to your Favorites.
    </p>
  );
};

export const QuestionMessage = ({ className }) => {
  return (
    <p className={className}>
      Want to view your favorites?&nbsp;
      <a href="/join-us" className="grey-font">
        Join us
      </a>
      &nbsp; or&nbsp;
      <a href="/sign-in" className="grey-font">
        Sign-in
      </a>
    </p>
  );
};

export default BagFavorites;
