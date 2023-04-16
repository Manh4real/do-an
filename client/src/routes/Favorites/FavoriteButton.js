import React, { useEffect, useState } from "react";
import clsx from "clsx";

import { useEditContext } from "./Favorites";

import { HeartIcon, FilledHeartIcon } from "components/Icons";

const FavoriteButton = ({ item }) => {
  const { editing, handleEditing } = useEditContext();
  const [filled, setFilled] = useState(true);

  useEffect(() => {
    if (!editing) setFilled(true);
  }, [editing]);
  const handleClick = (e) => {
    e.stopPropagation();

    handleEditing(
      { product_id: item.product_id, added: { colorId: item.added.colorId } },
      filled ? "uncheck" : "check"
    );
    setFilled((prev) => !prev);
  };

  if (!editing) return <></>;

  return (
    <div className={clsx("favorite-button-ctn", { checked: !filled })}>
      <div
        onClick={handleClick}
        className="favorite-item__fav-button flex-center"
      >
        <button className="flex-center">
          {filled ? <FilledHeartIcon w="26" h="26" /> : <HeartIcon />}
        </button>
      </div>
    </div>
  );
};

export default FavoriteButton;
