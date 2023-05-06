import React from "react";
import { Link, NavLink } from "react-router-dom";

import {
  ChartIcon,
  DashboardIcon,
  InventoryIcon,
  Logo,
  OrderIcon,
  ProductIcon,
  ReviewIcon,
  UsersIcon,
} from "../../Icons";
import AccountSection from "./AccountSection";

function Sidebar() {
  const getNavLinkClasses = ({ isActive }: { isActive: boolean }) => {
    let c = "";
    if (isActive) c = "bg-gray-800 text-white";
    else c = "hover:bg-gray-800 hover:text-white text-black";

    return (
      "flex items-center justify-center gap-2 font-medium p-3 rounded-lg " +
      c +
      " xl:justify-start"
    );
  };

  return (
    <div className="fixed top-0 bottom-0 left-0 z-30 w-1/6 overflow-auto container p-4 bg-gray-50 h-[100%] flex flex-col justify-between">
      <div>
        <Link
          to="/"
          className="flex flex-row items-center justify-center gap-3 mb-8 py-3 border-b-2 border-b-gray-200"
        >
          <Logo />
          <span className="font-medium hidden xl:inline-block">
            For The World.
          </span>
        </Link>

        <nav>
          <ul>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/">
                <DashboardIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Dashboard
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/products">
                <ProductIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Products Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/users">
                <UsersIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Users Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/orders">
                <OrderIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Orders Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/reviews">
                <ReviewIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Reviews Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/inventory">
                <InventoryIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Inventories
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/analytics">
                <ChartIcon />
                <span className="hidden text-ellipsis overflow-hidden xl:block">
                  Analytics
                </span>
              </NavLink>
            </li>
          </ul>
        </nav>
      </div>

      <AccountSection />
    </div>
  );
}

export default Sidebar;
