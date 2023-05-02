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

    return "flex items-center gap-2 font-medium p-3 rounded-lg " + c;
  };

  return (
    <div className="fixed top-0 bottom-0 left-0 z-30 w-1/6 overflow-auto container p-4 bg-gray-50 h-[100%] flex flex-col justify-between">
      <div>
        <Link
          to="/"
          className="flex flex-row items-center gap-3 mb-8 py-3 border-b-2 border-b-gray-200"
        >
          <Logo />
          <span className="font-medium">For The World.</span>
        </Link>

        <nav>
          <ul>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/">
                <DashboardIcon />
                <span className="block text-ellipsis overflow-hidden">
                  Dashboard
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/products">
                <ProductIcon />
                <span className="block text-ellipsis overflow-hidden">
                  Products Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/users">
                <UsersIcon />
                <span className="block text-ellipsis overflow-hidden">
                  Users Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/orders">
                <OrderIcon />
                <span className="block text-ellipsis overflow-hidden">
                  Orders Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/reviews">
                <ReviewIcon />
                <span className="block text-ellipsis overflow-hidden">
                  Reviews Management
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/inventory">
                <InventoryIcon />
                <span className="block text-ellipsis overflow-hidden">
                  Inventories
                </span>
              </NavLink>
            </li>
            <li className="mb-2">
              <NavLink className={getNavLinkClasses} to="/analytics">
                <ChartIcon />
                Analytics
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
