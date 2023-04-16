import React, { useState } from "react";
import { useParams } from "react-router-dom";
import clsx from "clsx";

import { ArrowIcon } from "../Icons";
import Colors from "./Colors";
import Sizes from "./Sizes";
import ReviewsDetailsTag from "./Reviews";
import { ViewProductDetails } from "./ViewProductDetails";

// Redux-related
import { useDispatch, useSelector } from "react-redux";
import {
  selectUserStatus,
  updateFavorites,
  addFavorite,
} from "features/user/userSlice";
import { addToBag } from "features/bag/bagSlice";
import StyledInfo from "./StyledInfo";
import useRedirect from "hooks/useRedirect";

function Info({ colors, product, handleChangeSelectedColorId }) {
  const dispatch = useDispatch();

  const { colorTypeId } = useParams();
  const [item, setItem] = useState({
    colorId: colorTypeId,
    size: null,
    quantity: 1,
  });

  const [error, setError] = useState(false);

  const isLoggedIn = useSelector(selectUserStatus) === "succeeded";
  const redirect = useRedirect();

  const handleAdd = () => {
    if (!item.size) {
      setError(true);
      return;
    }

    dispatch(addToBag({ ...product, added: { ...item } }));
    handleRefresh();
  };

  const handleError = () => {
    setError(false);
  };
  const handleColorChange = (colorId) => {
    setItem((prev) => ({ ...prev, colorId }));
    handleChangeSelectedColorId(colorId);
  };
  const handleSizeChange = (size) => {
    setItem((prev) => ({ ...prev, size }));
  };
  const handleAddFavorite = () => {
    if (!isLoggedIn) {
      alert("Please log in to continue!");
      redirect({ to: "/sign-in" });

      return;
    }

    if (!item.size) {
      setError(true);
      return;
    }

    dispatch(
      addFavorite({
        productId: product.product_id,
        colorId: item.colorId,
        size: item.size,
      })
    )
      .unwrap()
      .then((result) => {
        // console.log(result);
        dispatch(updateFavorites(result));
      })
      .finally(() => {
        handleRefresh();
      });

    // dispatch(updateFavorites({ ...product, added: { ...item } }));
  };
  const handleRefresh = () => {
    setItem({
      colorId: colorTypeId,
      size: null,
      quantity: 1,
    });
  };

  const remainingCount = product.quantity;

  return (
    <StyledInfo>
      <h4>{product.category}</h4>
      <h1 className="large-font capitalized-text">{product.product_name}</h1>
      <p className="regular-font">{product.target}</p>
      <div className="medium-font">{product.brand_name}</div>

      <div className="price">
        ${product.price}
        {product.oldPrice ? <del>${product.oldPrice}</del> : ""}
      </div>

      <Colors imageColors={colors} handleColorChange={handleColorChange} />

      <div
        className={clsx("mt-15", "grey-font", {
          "red-font": remainingCount <= 0,
        })}
        style={{ display: "block" }}
      >
        {remainingCount > 0 ? remainingCount + " remaining" : "Sold Out"}
      </div>

      {remainingCount > 0 && (
        <React.Fragment>
          <Sizes
            selectedSizeId={item.size}
            error={{ isError: error, handleError }}
            sizes={product.sizes || []}
            handleSizeChange={handleSizeChange}
          />

          <div className="btns">
            <button className="add-to-bag-btn hover-w-fade" onClick={handleAdd}>
              Add to Bag
            </button>
            <button className="favorite-btn" onClick={handleAddFavorite}>
              Favorite
            </button>
          </div>
        </React.Fragment>
      )}

      <div className="shipping sb">
        <div className="small-title regular-font">Shipping*</div>
        <p className="regular-font">
          To get accurate shipping information
          <br />
          <a
            className="edit-location underlined hover-w-hl-udl"
            href="/"
            target="_blank"
          >
            Edit Location
          </a>
        </p>
      </div>

      <div className="free-pickup sb regular-font">
        <div className="small-title">Free Pickup</div>
        <a href="/" className="underlined hover-w-hl-udl" target="_blank">
          Find a Store
        </a>

        <p>
          <small>*Faster Shipping options may be available</small>
        </p>
      </div>

      <div className="short-desc sb regular-font">
        <p>{product.description}</p>

        <ViewProductDetails product={product} />
      </div>

      <div className="misc regular-font">
        <DetailsTag summary="Free Shipping & Returns">
          Free standard shipping and free 60-day returns for Nike Members.{" "}
          <a
            href="/"
            target="_blank"
            style={{ textDecoration: "underline" }}
            className="hover-w-fade"
          >
            Learn more
          </a>
          .&nbsp;
          <a
            href="/"
            target="_blank"
            style={{ textDecoration: "underline" }}
            className="hover-w-fade"
          >
            Return policy exclusions apply
          </a>
          .
        </DetailsTag>

        <DetailsTag summary="How This Was Made">
          <ul style={{ listStyle: "initial" }}>
            <li>
              This product was responsibly designed utilizing recycled materials
              from post-consumer and/or post-manufactured waste. One of our
              biggest steps on our journey to zero carbon and zero waste is in
              choosing our materials because they account for more than 70% of
              any product's footprint. By reusing existing plastics, yarns, and
              textiles, we significantly reduce our emissions. Our goal is to
              use as much recycled materials as possible without compromising on
              performance, durability and style.
            </li>
            <li>
              Learn more about our{" "}
              <a
                href="/"
                target="_blank"
                style={{ textDecoration: "underline" }}
                className="hover-w-fade"
              >
                Move to Zero
              </a>
              &nbsp; journey towards zero carbon and zero waste, including how
              we're working to design product with sustainability in mind and
              help protect the future of where we live and play.
            </li>
          </ul>
        </DetailsTag>

        <ReviewsDetailsTag productId={product.product_id} />
      </div>
    </StyledInfo>
  );
}

export const DetailsTag = ({ summary, children, icon = "" }) => {
  const [open, setOpen] = useState(false);

  const handleOpen = (e) => {
    e.preventDefault();
    setOpen((prev) => !prev);
  };

  return (
    <details open={open}>
      <summary className="medium-font flex-spbw" onClick={handleOpen}>
        <span className="flex-1 flex-spbw">
          {summary}
          {icon}
        </span>
        <div>
          <ArrowIcon toggle={open} />
        </div>
      </summary>
      <div className="content">{children}</div>
    </details>
  );
};

export default Info;
