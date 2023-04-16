import React from "react";

import { withScrollControl } from "hoc";

import { ArrowIcon } from "components/Icons";
import StyledMBCarousel from "./StyledMBCarousel";

const MBCarousel = React.forwardRef(
  ({ disabled, handleSlideLeft, handleSlideRight }, ref) => {
    return (
      <StyledMBCarousel>
        <div className="title font-24 capitalized-text">Member Benefits</div>
        <div className="container">
          <div className="mb-benefits__slide-btn left">
            <button
              className="flex-center"
              disabled={disabled.left}
              onClick={handleSlideLeft}
            >
              <ArrowIcon type="left" />
            </button>
          </div>
          <div ref={ref} className="profile__carousel mb-carousel">
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Member-only Products
                </div>
              </a>
            </div>
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Product Advice From Nike Experts
                </div>
              </a>
            </div>
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Free Running & Training Apps
                </div>
              </a>
            </div>
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Nike Partnerships & Events
                </div>
              </a>
            </div>
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Free Shipping With Every Order
                </div>
              </a>
            </div>
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Exclusive Deals
                </div>
              </a>
            </div>
            <div className="profile__carousel-item mb-carousel__item">
              <a href="/">
                <div className="mb-carousel__item-image">
                  <img src="/images/member-benefits-1.jpg" width="320" alt="" />
                </div>
                <div className="profile__carousel-title bigger-font">
                  Special Benefits in Nike Stores
                </div>
              </a>
            </div>
          </div>
          <div className="mb-benefits__slide-btn right">
            <button
              className="flex-center"
              disabled={disabled.right}
              onClick={handleSlideRight}
            >
              <ArrowIcon type="right" />
            </button>
          </div>
        </div>
      </StyledMBCarousel>
    );
  }
);

export default withScrollControl(MBCarousel, 350);
