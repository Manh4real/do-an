import React, { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";

// import { Carousel } from "components/Carousel";
import { RelatedProductsCarousel } from "components/Carousel";

import Spinner from "components/Spinner";
import StyledCart from "./StyledCart";
import BagFavorites from "./BagFavorites";
import BagProductInfo from "./BagProductInfo";
import PromoCodeInput from "./PromoCodeInput";

// import PaypalButton from "components/PaypalButton";

// Redux-related
import { useBag } from "App";
import { formatCurrency } from "helpers";

function Cart() {
  const bag = useBag();
  const [loading, setLoading] = useState(true);

  const location = useLocation();
  const navigate = useNavigate();

  useEffect(() => {
    // console.log("cart: ", location);
    const timeID = setTimeout(() => {
      setLoading(false);
    }, 3000);

    return () => clearTimeout(timeID);
  }, [location]);

  const subtotal = bag.reduce((t, p) => t + p.price * p.added.quantity, 0);
  const tax = 0;
  const shipping = subtotal ? 30000 : 0;
  const total = subtotal + tax + shipping;
  const isEmpty = bag.length === 0;

  return (
    <StyledCart>
      <div className="bag__products-info">
        <div className="title medium-font">Bag</div>
        <div className="content">
          {bag.length ? (
            bag.map((product) => (
              <BagProductInfo key={product.added.baggedId} product={product} />
            ))
          ) : (
            <EmptyBagMessage />
          )}
        </div>
      </div>
      <div className="bag__summary">
        <div className="title medium-font">Summary</div>
        <div className="bag__summary-content">
          <PromoCodeInput />
          <div className="flex-spbw bag__summary-row w-100">
            <div className=" title">Subtotal</div>
            <div className=" price">
              {formatCurrency(subtotal)}
              <span className="small-font"> VND</span>
            </div>
          </div>
          <div className="flex-spbw bag__summary-row w-100">
            <div className=" title">Estimated Shipping & Handling</div>
            <div className=" price">
              {formatCurrency(shipping)}
              <span className="small-font"> VND</span>
            </div>
          </div>
          <div className="flex-spbw bag__summary-row w-100">
            <div className=" title">Estimated Tax</div>
            <div className=" price">
              {tax ? (
                <>
                  {formatCurrency(tax)}
                  <span className="small-font"> VND</span>
                </>
              ) : (
                "—"
              )}
            </div>
          </div>
          <div className="flex-spbw bag__summary-row w-100 bordered-top-bottom">
            <div className=" title ">Total</div>
            <div className=" price bold-font">
              {formatCurrency(total)}
              <span className="small-font bold-font"> VND</span>
            </div>
          </div>
        </div>
        <div className="bag__summary-btns">
          <div className="checkout-btn flex-center w-100">
            <button
              disabled={isEmpty}
              className="big-button w-100 regular-font hover-w-fade cta"
              onClick={() => !isEmpty && navigate("/checkout")}
            >
              Checkout
            </button>
          </div>
          <div className="paypal-btn flex-center w-100">
            <button
              disabled={isEmpty}
              className="big-button w-100 regular-font grey-bg"
            >
              <img src="/images/paypal@2x.png" width="50" alt="" />
            </button>
          </div>
          {/* <div className="w-100">
            <PaypalButton />
          </div> */}
        </div>
      </div>
      <BagFavorites />
      <div className="grid-col-span-all bag__footer flex-center">
        {loading ? (
          <Spinner />
        ) : (
          bag.length > 0 && (
            <RelatedProductsCarousel
              title="You Might Also Like"
              objectIDs={bag.map((p) => p.product_id)}
            />
          )
        )}
      </div>
    </StyledCart>
  );
}

const EmptyBagMessage = () => (
  <p className="empty-bag-mes">Your Bag is empty.</p>
);

export default Cart;
