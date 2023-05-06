import React from "react";
import clsx from "clsx";

import { LIST } from "../index";
import { useToggleMobileMenuContext } from "../TopMenu";

import StyledMobileMenuLinks from "./StyledMobileMenuLinks";
import MenuNestingLiTag from "./MenuNestingLiTag";
import MobileMenuMask from "./MobileMenuMask";
import { HeartIcon, OrderIcon, UserIcon } from "components/Icons";
import { Link } from "react-router-dom";

function MobileMenuLinks() {
  const { toggle, handleToggle } = useToggleMobileMenuContext();

  return (
    <>
      <StyledMobileMenuLinks className={clsx({ toggle: toggle })}>
        <ul>
          <li>
            <Link to="/account" className="hover-w-fade flex-spbw medium-font">
              <span className="flex-center gap-15">
                <UserIcon />
                Account
              </span>
            </Link>
          </li>
          <li>
            <Link
              to="/favorites"
              className="hover-w-fade flex-spbw medium-font"
            >
              <span className="flex-center gap-15">
                <HeartIcon />
                Favorites
              </span>
            </Link>
          </li>
          <li className="mb-25">
            <Link to="/orders" className="hover-w-fade flex-spbw medium-font">
              <span className="flex-center gap-15">
                <OrderIcon />
                Orders
              </span>
            </Link>
          </li>
          {LIST.map((item, i) => {
            return <RootMenuTitle key={i} item={item} />;
          })}
        </ul>
      </StyledMobileMenuLinks>
      <MobileMenuMask active={toggle} handleToggle={handleToggle} />
    </>
  );
}

const RootMenuTitle = ({ item }) => {
  return (
    <MenuNestingLiTag
      className="root-menu-title"
      prevIsAll={true}
      priHref={item.href}
      name={item.name}
      fontSizeClass="large-font"
    >
      <ul>
        {item.categories.list.map((ctg, i) => {
          return (
            <MenuNestingLiTag prev={item.name} key={i} name={ctg.name}>
              <ul>
                {ctg.titles.map((ct, i) => {
                  return (
                    <li key={i}>
                      <Link to="/">{ct}</Link>
                    </li>
                  );
                })}
              </ul>
            </MenuNestingLiTag>
          );
        })}
      </ul>
    </MenuNestingLiTag>
  );
};

export default MobileMenuLinks;
