import React, { useMemo } from "react";

import { useBag } from "App";
import { TrashCan, ThinnerHeart } from "components/Icons";
import BagSelect from "./BagSelect";
import ShippingInfo from "./ShippingInfo";

// Redux-related
import { useDispatch, useSelector } from "react-redux";
import {
  selectUserStatus,
  updateFavorites,
  addFavorite,
} from "features/user/userSlice";
import { modifyFromBag, removeFromBag } from "features/bag/bagSlice";
import { useDownloadImage } from "hooks";
import BagProductColor from "./BagProductColor";
import useRedirect from "hooks/useRedirect";
import { formatCurrency } from "helpers";
import BagSelectSize from "./BagSelectSize";
import { Link } from "react-router-dom";

function BagProductInfo({ product }) {
  const dispatch = useDispatch();

  const bag = useBag();

  const isLoggedIn = useSelector(selectUserStatus) === "succeeded";

  const redirect = useRedirect();

  const quantity = useMemo(() => {
    const r = bag.find(
      (p) =>
        p.product_id === product.product_id &&
        p.added.size === product.added.size
    );
    return r.added.quantity || 1;
  }, [bag, product]);

  // cover image of a bag item
  const colorId = product.added.colorId;
  const imageName = product.images[colorId][0].url;

  const { url } = useDownloadImage(imageName);

  const handleChange = (modifiedValue, type) => {
    dispatch(
      modifyFromBag({
        baggedId: product.added.baggedId,
        modifiedType: type,
        modifiedValue,
      })
    );
  };
  const handleDelete = () => {
    dispatch(removeFromBag(product.added.baggedId));
  };
  const handleAddFavorite = async () => {
    if (!isLoggedIn) {
      alert("Please log in to continue!");
      redirect({ to: "/sign-in" });

      return;
    }

    // ADD TO FAVORITES...
    console.log("adding...");
    dispatch(
      addFavorite({
        productId: product.product_id,
        colorId: product.added.colorId,
        size: product.added.size,
      })
    )
      .unwrap()
      .then((result) => {
        // console.log(result);
        dispatch(updateFavorites(result));
      });
  };

  return (
    <div className="bag__product-info">
      <div className="upper flex-spbw">
        <Link
          to={`/products/${product.product_id}/${product.added.colorId}`}
          className="bag__pd-image grey-bg"
        >
          <img src={url || imageName} alt="" />
        </Link>
        <div className="flex-start">
          <div className="bag__pd-content flex-spbw">
            <div>
              <Link
                to={`/products/${product.product_id}/${product.added.colorId}`}
                className="regular-font"
              >
                {product.product_name}
              </Link>
              <div className="grey-font">
                <div className="regular-font">{product.target}</div>
                <BagProductColor colorId={product.added.colorId} />
                <div className="flex-start">
                  <BagSelectSize
                    label="size"
                    value={product.added.size.size_id}
                    product={product}
                    options={product.stock[colorId]
                      .filter((s) => s.quantity > 0)
                      .map((s) => ({
                        size_id: s.size_id,
                        size: s.size,
                      }))}
                    handleChange={handleChange}
                  />
                  <BagSelect
                    label="quantity"
                    value={quantity}
                    product={product}
                    options={[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]}
                    handleChange={handleChange}
                  />
                </div>
              </div>
            </div>
            <div className="bag__buttons">
              <div className="favorite-btn" onClick={handleAddFavorite}>
                <button>
                  <ThinnerHeart w="24px" h="24px" />
                </button>
              </div>
              <div className="delete-btn" onClick={handleDelete}>
                <button>
                  <TrashCan w="24px" h="24px" />
                </button>
              </div>
            </div>
          </div>
          <div className="bag__pd-price">
            {formatCurrency(product.price)}
            <span className="small-font"> VND</span>
          </div>
        </div>
      </div>
      <ShippingInfo />
      {/* <div className="regular-font">
        <h4>Free Pickup</h4>
        <p>
          <button className="underlined regular-font hover-w-hl-udl">
            Find a Store
          </button>
        </p>
      </div> */}
    </div>
  );
}

export default BagProductInfo;
