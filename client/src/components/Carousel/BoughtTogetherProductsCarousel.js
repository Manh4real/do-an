import React from "react";

import clsx from "clsx";

import StyledCarousel from "./StyledCarousel";
import { withScrollControl } from "../../hoc";
import { ThinnerArrowIcon } from "components/Icons";

import { CarouselProduct } from "./CarouselProducts";
import { withBoughtTogetherProducts } from "hoc";

const BoughtTogetherProductsCarousel = React.forwardRef(
  (
    {
      objectIDs,
      fallbackComponent,
      title,
      disabled,
      handleSlideLeft,
      handleSlideRight,
    },
    ref
  ) => {
    return (
      <StyledCarousel>
        <div className="main-section carousel-container">
          <div className="carousel-title mb-10">
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
          <div ref={ref} className="carousel" id="carousel">
            <Carousel
              classNames={{
                container: "carousel-container",
                list: "carousel",
                item: "product-container",
              }}
              objectIDs={objectIDs}
            />
          </div>
        </div>
      </StyledCarousel>
    );
  }
);

const Carousel = withBoughtTogetherProducts(CarouselProduct, "#carousel");

export default withScrollControl(BoughtTogetherProductsCarousel);
