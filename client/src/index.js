import React, { Suspense } from "react";
import ReactDOM from "react-dom";
import { BrowserRouter, Routes, Route } from "react-router-dom";

// Redux-related
import { Provider } from "react-redux";
import store from "store";

import "./index.css";

import App from "App";
import {
  JoinUsPage,
  SignInPage,
  NotFound,
  Home,
  // Account,
  // Checkout,
  // Cart,
  // Favorites,
} from "./routes";
import { MainLayout, Layout, CheckoutLayout } from "routes/Layout";

import { ProductDetails } from "components/ProductDetails";
import ShopMain from "components/Main/Main";
import Spinner from "components/Spinner";

import ErrorBoundary from "components/ErrorBoundary";

import reportWebVitals from "./reportWebVitals";
import FormLayout from "routes/Layout/FormLayout";
import ReviewsPage from "routes/ReviewsPage";
import SimpleLayout from "routes/Layout/SimpleLayout";
import PaymentError from "routes/PaymentError";
import OrderResult from "routes/OrderResult";

const Favorites = React.lazy(() => import("routes/Favorites/Favorites"));
const Checkout = React.lazy(() => import("routes/Checkout/Checkout"));
const Account = React.lazy(() => import("routes/Account/Account"));
const Cart = React.lazy(() => import("routes/Cart/Cart"));
const Orders = React.lazy(() => import("routes/Orders"));
const OrderSuccessInform = React.lazy(() =>
  import("routes/OrderSuccessInform")
);

ReactDOM.render(
  <BrowserRouter>
    <ErrorBoundary>
      <Suspense fallback={<Spinner />}>
        <React.StrictMode>
          <Provider store={store}>
            <Routes>
              <Route path="/" element={<App />}>
                <Route element={<MainLayout />}>
                  <Route index element={<Home />} />
                  <Route path="/shop">
                    <Route index element={<ShopMain />} />
                    <Route path=":productType" element={<ShopMain />} />
                    <Route path="s">
                      <Route index element={<ShopMain />} />
                      <Route path=":style" element={<ShopMain />} />
                    </Route>
                  </Route>
                  <Route
                    path="products/:productId"
                    element={<ProductDetails />}
                  >
                    <Route path=":colorTypeId" element={<ProductDetails />} />
                  </Route>
                  <Route path="*" element={<NotFound />} />
                </Route>
                <Route element={<Layout />}>
                  <Route path="favorites" element={<Favorites />} />
                  <Route path="account" element={<Account />} />
                  <Route path="cart" element={<Cart />} />
                </Route>
                <Route element={<FormLayout />}>
                  <Route path="join-us" element={<JoinUsPage />} />
                  <Route path="sign-in" element={<SignInPage />} />
                </Route>
                <Route element={<SimpleLayout />}>
                  <Route path="reviews/:productId" element={<ReviewsPage />} />
                  <Route
                    path="/place-order-success"
                    element={<OrderSuccessInform />}
                  />
                  <Route path="/order-result" element={<OrderResult />} />
                  <Route path="/payment-error" element={<PaymentError />} />
                </Route>
                <Route element={<CheckoutLayout />}>
                  <Route path="/orders" element={<Orders />} />
                  <Route path="/checkout" element={<Checkout />} />
                </Route>
              </Route>
            </Routes>
          </Provider>
        </React.StrictMode>
      </Suspense>
    </ErrorBoundary>
  </BrowserRouter>,
  document.getElementById("root")
);

reportWebVitals();
