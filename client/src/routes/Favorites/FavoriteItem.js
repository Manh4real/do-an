import React from "react";

import FavoriteButton from "./FavoriteButton";

import { useDownloadImage } from "hooks";
import { formatCurrency } from "helpers";
import { Link } from "react-router-dom";

const FavoriteItem = ({ item }) => {
  const imageName = item.images[item.added.colorId][0].url;

  const { url } = useDownloadImage(imageName);

  return (
    <div className="favorite-item">
      <div className="position-relative">
        <Link
          to={`/products/${item.product_id}/${item.added.colorId}`}
          className="favorite-item__image flex-start"
          style={{
            background: "#f1f1f1",
            minWidth: 200,
            minHeight: 200,
          }}
        >
          <img src={url || imageName} alt="" />
        </Link>
        <FavoriteButton item={item} />
      </div>

      <div className="favorite-info flex-spbw">
        <div>
          <div className="favorite-item__title medium-font">
            {item.product_name}
          </div>
          <div className="favorite-item__type grey-font small-font">
            {item.target}
          </div>
          <div className="favorite-item__type grey-font font-14">
            Size: {item.added.size.size}
          </div>
        </div>
        <div className="favorite-item__price medium-font">
          {formatCurrency(item.price)}
          <span className="small-font"> &nbsp;VND</span>
        </div>
      </div>

      <button className="select-size-btn regular-font">Select size</button>
    </div>
  );
};

export default FavoriteItem;
