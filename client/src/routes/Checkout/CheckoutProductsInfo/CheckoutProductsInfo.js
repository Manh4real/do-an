import React from "react";

import { stringifyDate } from "script";
import CheckoutProduct from "./CheckoutProduct";

// Redux-related
import { useCheckoutInfo } from "features/checkout/checkoutSlice";

import { THREE_DAYS_TIME } from "../../../constants";
import { formatCurrency } from "helpers";
import { Link } from "react-router-dom";

function CheckoutProductsInfo() {
  const { products } = useCheckoutInfo();

  const arrivedDate = stringifyDate(
    new Date(Date.now() + THREE_DAYS_TIME),
    true
  );
  return (
    <div className="checkout__info checkout__block">
      <div className="title checkout__info-title flex-spbw">
        IN YOUR BAG
        <Link to="/cart" className="small-font">
          Edit
        </Link>
      </div>
      <main>
        <div className="checkout__prices">
          <div className="row flex-spbw">
            <span>Subtotal</span>
            <span>
              {formatCurrency(products.subtotal)}
              <span className="small-font"> VND</span>
            </span>
          </div>
          <div className="row flex-spbw">
            <span>Estimated Shipping</span>
            <span>
              {formatCurrency(products.shipping)}
              <span className="small-font"> VND</span>
            </span>
          </div>
          <div className="row flex-spbw">
            <span>Estimated Tax</span>
            <span>
              {products.tax ? (
                <>
                  {formatCurrency(products.tax)}
                  <span className="small-font"> VND</span>
                </>
              ) : (
                "—"
              )}
            </span>
          </div>
          <div className="row flex-spbw checkout__total-row">
            <span className="checkout__total regular-font">Total</span>
            <span className="checkout__total-price">
              {formatCurrency(
                products.subtotal + products.shipping + products.tax
              )}
              <span className="small-font"> VND</span>
            </span>
          </div>
        </div>
        <div className="checkout__products">
          <div className="title checkout__time">ARRIVES BY {arrivedDate}</div>
          {products.products.length &&
            products.products.map((product, i) => {
              return <CheckoutProduct key={i} product={product} />;
            })}
        </div>
      </main>
    </div>
  );
}

export default CheckoutProductsInfo;
