import React from "react";
import { Link } from "react-router-dom";

// import { useGlobalContext } from "App";
import BagIcon from "components/Icons/BagIcon";
import StyledBag from "./StyledBag";

// Redux-related
import { useBag } from "App";

function Bag() {
  // const [{ bag }] = useGlobalContext();
  const bag = useBag();

  return (
    <StyledBag>
      <Link to="/cart" className="flex-center">
        <div className="bag__number">{bag?.length}</div>
        <BagIcon />
      </Link>
    </StyledBag>
  );
}

export default Bag;
