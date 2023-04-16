import React from "react";
import clsx from "clsx";

import StyledCarousel from "./StyledCarousel";
import { withScrollControl } from "../../hoc";
import { ThinnerArrowIcon } from "components/Icons";
import CarouselProducts from "./CarouselProducts";

const Carousel = React.forwardRef(
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

          <CarouselProducts ref={ref} />
        </div>
      </StyledCarousel>
    );
  }
);

export default withScrollControl(Carousel);
