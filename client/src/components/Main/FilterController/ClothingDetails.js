import React, { useMemo, useState } from "react";

import clsx from "clsx";

// import { setType } from "./actions";
import { types } from "../data";
import { NavLink, useParams, useSearchParams } from "react-router-dom";

function ClothingDetails({ handleClick }) {
  const [active, setActive] = useState(false);

  const _handleClick = (e) => {
    // handleClick(action);
    setActive(e.currentTarget.dataset.type);
  };

  return (
    <div className="filter-ctg clothing-type">
      <ul>
        {types.map((type, i) => {
          const filterName = { "data-type": type.filterName };
          return (
            <Li
              key={i}
              {...filterName}
              type={type.filterName}
              active={active}
              //setType(type.filterName)
              handleClick={(e) => _handleClick(e)}
            >
              {type.name}
            </Li>
          );
        })}
      </ul>
    </div>
  );
}

const Li = (props) => {
  const [searchParams] = useSearchParams();

  const queryString = useMemo(() => {
    return "?" + searchParams.toString();
  }, [searchParams]);
  const { productType: currentProductType } = useParams();

  const { handleClick, type, active, ...otherProps } = props;

  return (
    <li {...otherProps} onClick={handleClick}>
      <NavLink
        to={"/shop/" + type + queryString}
        className={clsx({ active: currentProductType === type })}
      >
        {props.children}
      </NavLink>
    </li>
  );
};

export default ClothingDetails;
