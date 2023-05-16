import React, { useEffect } from "react";

import { CheckoutProductsInfo } from "./CheckoutProductsInfo";
import Steps from "./Steps";

import StyledCheckout from "./StyledCheckout";
import {
  updateProductsInfo,
  useCheckoutInfo,
} from "features/checkout/checkoutSlice";
import { useDispatch } from "react-redux";

import { useBag } from "App";
import BoughtTogetherProductsCarousel from "components/Carousel/BoughtTogetherProductsCarousel";
// import { payment } from "api";
import { Link } from "react-router-dom";
// import { stringifyDate } from "script";

export default function Checkout() {
  useEffect(() => {
    document.title = "Checkout | 4TW";
  }, []);
  const bag = useBag();

  const dispatch = useDispatch();

  useEffect(() => {
    const subtotal = bag.reduce((a, p) => a + p.price * p.added.quantity, 0);
    const shipping = 30000;
    const tax = 0;

    dispatch(
      updateProductsInfo({
        subtotal,
        shipping,
        tax,
        products: bag,
      })
    );
  }, [bag, dispatch]);

  const checkoutInfo = useCheckoutInfo();

  if (!checkoutInfo.products?.products?.length)
    return (
      <h2 className="flex-center" style={{ height: "80vh" }}>
        There's no products to checkout
        <Link to="/shop" className="cta medium-button ml-20">
          Go to shop
        </Link>
      </h2>
    );

  return (
    <StyledCheckout>
      <div className="checkout-content__grid">
        <div className="title grid-col-span-3">CHECKOUT</div>
        <Steps />
        <CheckoutProductsInfo />

        <div className="grid-col-span-3 mt-50">
          <BoughtTogetherProductsCarousel
            title="Frequently Bought Together"
            objectIDs={checkoutInfo.products.products.map((p) => p.product_id)}
          />
        </div>
      </div>
    </StyledCheckout>
  );
}
