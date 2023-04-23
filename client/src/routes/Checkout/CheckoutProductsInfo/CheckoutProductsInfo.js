import React, { useEffect } from "react";

import { stringifyDate } from "script";
// Redux-related
import { useBag } from "App";

import CheckoutProduct from "./CheckoutProduct";
import { useDispatch } from "react-redux";
import { updateProductsInfo } from "features/checkout/checkoutSlice";

import { THREE_DAYS_TIME } from "../../../constants";
import { formatCurrency } from "helpers";

function CheckoutProductsInfo() {
  const bag = useBag();

  const subtotal = bag.reduce((a, p) => a + p.price * p.added.quantity, 0);
  const shipping = 30000;
  const tax = 0;
  const arrivedDate = stringifyDate(
    new Date(Date.now() + THREE_DAYS_TIME),
    true
  );

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

  return (
    <div className="checkout__info checkout__block">
      <div className="title checkout__info-title flex-spbw">
        IN YOUR BAG
        <a href="/cart" className="small-font">
          Edit
        </a>
      </div>
      <main>
        <div className="checkout__prices">
          <div className="row flex-spbw">
            <span>Subtotal</span>
            <span>
              {formatCurrency(subtotal)}
              <span className="small-font"> VND</span>
            </span>
          </div>
          <div className="row flex-spbw">
            <span>Estimated Shipping</span>
            <span>
              {formatCurrency(shipping)}
              <span className="small-font"> VND</span>
            </span>
          </div>
          <div className="row flex-spbw">
            <span>Estimated Tax</span>
            <span>
              {tax ? (
                <>
                  {formatCurrency(tax)}
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
              {formatCurrency(subtotal + shipping + tax)}
              <span className="small-font"> VND</span>
            </span>
          </div>
        </div>
        <div className="checkout__products">
          <div className="title checkout__time">ARRIVES BY {arrivedDate}</div>
          {bag.length &&
            bag.map((product, i) => {
              return <CheckoutProduct key={i} product={product} />;
            })}
        </div>
      </main>
    </div>
  );
}

export default CheckoutProductsInfo;
