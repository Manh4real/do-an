import React from "react";
import { Routes, Route } from "react-router-dom";

import DefaultLayout from "./Layout/DefaultLayout";

import Home from "./pages/Home";
import NotFound from "./pages/NotFound";
import Products from "./pages/Products";
import Users from "./pages/Users";
import Signin from "./pages/Signin";
import Account from "./pages/Account";

import Logout from "./pages/Logout";
import Orders from "./pages/Orders";
import OrderDetails from "./pages/OrderDetails";
import Inventory from "./pages/Inventory";

function App() {
  return (
    <div className="App">
      <Routes>
        <Route element={<DefaultLayout />}>
          <Route path="/" element={<Home />} />
          <Route path="/home" element={<Home />} />
          <Route path="/products" element={<Products />} />
          <Route path="/users" element={<Users />} />
          <Route path="/orders" element={<Orders />} />
          <Route path="/orders/details/:orderId" element={<OrderDetails />} />
          <Route path="/account" element={<Account />} />
          <Route path="/inventory" element={<Inventory />} />
        </Route>
        <Route path="/sign-in" element={<Signin />} />
        <Route path="/logout" element={<Logout />} />
        <Route path="*" element={<NotFound />} />
      </Routes>
    </div>
  );
}

export default App;
