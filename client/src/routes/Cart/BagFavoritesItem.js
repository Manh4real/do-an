import React from "react";
import { Link } from "react-router-dom";

import { useDownloadImage } from "hooks";

// Redux-related
import { useDispatch } from "react-redux";
import { addToBag } from "features/bag/bagSlice";
import { formatCurrency } from "helpers";

const BagFavoritesItem = ({ product }) => {
  const dispatch = useDispatch();

  const imageName = product.images[product.added.colorId][0].url;
  const { url } = useDownloadImage(imageName);

  const handleClick = () => {
    dispatch(
      addToBag({
        ...product,
        added: {
          ...product.added,
          quantity: 1,
        },
      })
    );
  };

  return (
    <div className="item flex-start">
      <Link
        to={`/products/${product.product_id}/${product.added.colorId}`}
        className="image grey-bg"
        style={{ width: 150, height: 150 }}
      >
        {url && <img src={url} alt={product.product_name} />}
      </Link>
      <div className="info flex-1">
        <div className="flex">
          <div className="flex-1 regular-font">
            <Link
              to={`/products/${product.product_id}/${product.added.colorId}`}
              className="text-ellipsis-2"
              style={{
                maxWidth: 180,
              }}
            >
              {product.product_name}
            </Link>
            <div className="grey-font">{product.target}</div>
            <div className="grey-font">Size: {product.added.size.size}</div>
            <Link
              to={`/products/${product.product_id}/${product.added.colorId}`}
              className="select-size-btn hover-w-fade underlined regular-font grey-font"
            >
              Select Size
            </Link>
          </div>
          <div className="price regular-font">
            {formatCurrency(product.price)}
            <span className="small-font"> VND</span>
          </div>
        </div>
        <button
          className="addToBag-btn big-button regular-font mt-25"
          onClick={handleClick}
        >
          Add to bag
        </button>
      </div>
    </div>
  );
};

export default BagFavoritesItem;
