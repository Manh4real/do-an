import React, { useState, useEffect } from "react";
import clsx from "clsx";

import { getLatestProducts } from "services/products";

import { CarouselProduct } from "./CarouselProducts";

import StyledCarousel from "./StyledCarousel";
import { withScrollControl } from "../../hoc";
import { ThinnerArrowIcon } from "components/Icons";

const LatestProductsCarousel = React.forwardRef(
  ({ title, disabled, handleSlideLeft, handleSlideRight }, ref) => {
    return (
      <StyledCarousel>
        <div className="main-section carousel-container">
          <div className="carousel-title">
            <div className="pd-title font-24">{title}</div>
            <div className="sl-btns">
              <button
                className={clsx({
                  "disabled-sw-button": disabled.left,
                })}
                id="left-sl-crs-button"
                disabled={disabled.left}
                onClick={handleSlideLeft}
              >
                <ThinnerArrowIcon type="left" />
              </button>

              <button
                className={clsx({
                  "disabled-sw-button": disabled.right,
                })}
                id="right-sl-crs-button"
                disabled={disabled.right}
                onClick={handleSlideRight}
              >
                <ThinnerArrowIcon type="right" />
              </button>
            </div>
          </div>

          <LatestProducts ref={ref} />
        </div>
      </StyledCarousel>
    );
  }
);

const LatestProducts = React.forwardRef((_, ref) => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    const controller = new AbortController();

    getLatestProducts(1, { signal: controller.signal })
      .then((products) => {
        setProducts(products);
      })
      .catch((err) => console.log(err));

    return () => {
      controller.abort();
    };
  }, []);

  return (
    <div ref={ref} className="carousel" id="carousel">
      {products.map((p, i) => {
        return <CarouselProduct key={i} item={p} />;
      })}
    </div>
  );
});

export default withScrollControl(LatestProductsCarousel);
