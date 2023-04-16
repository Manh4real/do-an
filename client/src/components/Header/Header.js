import React from "react";

import VeryTop from "./VeryTop";
import Lower from "./Lower/Lower";

const Header = () => {
  return (
    <React.Fragment>
      <VeryTop />
      <Lower />
    </React.Fragment>
  );
};

export default React.memo(Header);
