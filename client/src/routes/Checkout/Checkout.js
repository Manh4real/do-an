import React, { useEffect } from "react";

import { CheckoutProductsInfo } from "./CheckoutProductsInfo";
import Steps from "./Steps";

import StyledCheckout from "./StyledCheckout";

export default function Checkout() {
  useEffect(() => {
    document.title = "Checkout | 4TW";
  }, []);

  return (
    <StyledCheckout>
      <div className="checkout-content__grid">
        <div className="title grid-col-span-3">CHECKOUT</div>
        <Steps />
        <CheckoutProductsInfo />
      </div>
    </StyledCheckout>
  );
}
