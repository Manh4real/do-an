import React from "react";
import BottomMenu from "./BottomMenu";
import { LatestProductsCarousel } from "components/Carousel";

import StyledHome from "./StyledHome";
import { Link } from "react-router-dom";

function Home() {
  return (
    <StyledHome>
      <div className="main-content-ctn">
        <div className="main-content-ctn-ctn">
          <div className="big-cover">
            <Link to="/shop">
              <div className="cover-title">
                <p className="df-fnt max-font">
                  THE BEST <br />
                  OF AIR MAX
                </p>
                <p className="regular-font">
                  Shoes that are always forwarding-facing <br />
                  and future embracing
                </p>

                <button className="shop-btn">Shop</button>
              </div>

              <div className="cover">
                <img
                  className="cover-image"
                  src="/nike-just-do-it.jpg"
                  alt=""
                />
              </div>
            </Link>
          </div>

          <LatestProductsCarousel title="The Latest And Greatest" />

          <div className="best-gift-ever">
            <div className="pd-title">Best Gifts Ever</div>
            <a href="/">
              <div className="bge-cover">
                <img src="/images/nike-just-do-it.jpg" width="100%" alt="" />
              </div>
              <div className="bge-title df-fnt max-font">
                OUTERWEAR FOR <br />
                ALL THE THINGS
              </div>
              <p className="regular-font">
                Warmth for exploring or posterizing yetis. Plus, more of the
                best gift ever.
              </p>
            </a>
            <div className="btns">
              <a href="/" className="shop-btn regular-font">
                Shop
              </a>
              <a href="/" className="shop-btn regular-font explore-btn">
                Explore
              </a>
            </div>
          </div>

          <div className="trending-now-ctn">
            <div className="pd-title">Trending Now</div>
            <div className="trending-now">
              <div className="itm-1">
                <a href="/">
                  <img src="./images/nike-just-do-it (1).jpg" alt="" />
                  <div className="title">
                    <h2 className="large-font">
                      Enter the World of Nike Fleece
                    </h2>
                    <button className="shop-btn">Shop</button>
                  </div>
                </a>
              </div>
              <div className="itm-2">
                <a href="/">
                  <img src="/images/nike-just-do-it (2).jpg" alt="" />
                  <div className="title">
                    <h2 className="large-font">
                      Enter the World of Nike Fleece
                    </h2>
                    <button className="shop-btn">Shop</button>
                  </div>
                </a>
              </div>
              <div className="itm-3">
                <a href="/">
                  <img src="/images/card.jpg" alt="" />
                  <div className="title">
                    <h2 className="large-font">
                      Enter the World of Nike Fleece
                    </h2>
                    <button className="shop-btn">Shop</button>
                  </div>
                </a>
              </div>
              <div className="itm-4">
                <div className="bg">
                  <img src="/images/bg.jpg" alt="" />
                </div>

                <div className="title">
                  <h1 className="max-font">BIG CHEER TO YOUR INBOX</h1>
                  <p>Sign up to stay up to date on the latest this Holiday.</p>
                  <a href="/" className="underlined">
                    Get Email Updates
                  </a>
                </div>
              </div>
            </div>
          </div>

          <BottomMenu />
        </div>
      </div>
    </StyledHome>
  );
}

export default Home;
