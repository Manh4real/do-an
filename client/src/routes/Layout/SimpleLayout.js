import React from "react";
import { Outlet, Link } from "react-router-dom";

import { Bag } from "components/Header/Bag";
import { Logo } from "components/Icons";
import SubFooterMenu from "components/Footer/SubFooterMenu";

import StyledCheckoutLayout from "./CheckoutLayout/StyledCheckoutLayout";

// Redux-related
import { useSelector } from "react-redux";
import {
  selectUser,
  selectUserStatus,
  useUserStatusLoading,
} from "features/user/userSlice";
import Spinner from "components/Spinner";

function SimpleLayout() {
  const user = useSelector(selectUser);
  const isIdle = useSelector(selectUserStatus) === "idle";
  const isLoading = useUserStatusLoading();

  if (isIdle) return "";

  if (isLoading) {
    return (
      <div className="checkout-spinner flex-center">
        <Spinner />
      </div>
    );
  }

  return (
    <StyledCheckoutLayout>
      <div>
        <header className="checkout__header flex-spbw">
          <a href="/">
            <Logo />
          </a>

          <div className="flex-start">
            <div className="checkout__bag-ctn flex-center">
              <Bag />
            </div>
            {!user && (
              <Link to="/sign-in" className="grey-font">
                Sign in
              </Link>
            )}
            {user && (
              <a href="/account" className="capitalized-text">
                {user.name.firstName} {user.name.lastName}
              </a>
            )}
          </div>
        </header>
        <main className="checkout__content">
          <Outlet />
        </main>
        <footer className="checkout__footer">
          <SubFooterMenu />
        </footer>
      </div>
    </StyledCheckoutLayout>
  );
}

export default SimpleLayout;
