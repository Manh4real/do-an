import React from "react";
import { Outlet } from "react-router-dom";

import Lower from "components/Header/Lower/Lower";
import Footer from "components/Footer/Footer";

function FormLayout() {
  return (
    <React.Fragment>
      <Lower />
      <Outlet />
      <Footer />
    </React.Fragment>
  );
}

export default FormLayout;
