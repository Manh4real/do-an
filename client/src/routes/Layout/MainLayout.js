import React from "react";
import { Outlet } from "react-router-dom";

import { Header } from "components/Header/";
import { AppFooter } from "components/Footer/";
import LinkSlide from "components/Header/LinkSlide";

function MainLayout() {
  return (
    <>
      <Header />
      <LinkSlide />
      <Outlet />
      <AppFooter />
    </>
  );
}

export default MainLayout;
