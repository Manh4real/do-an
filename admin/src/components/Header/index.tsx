import React from "react";
import { Link } from "react-router-dom";

function Header() {
  return (
    <header className="bg-white">
      <nav className="container mx-auto flex items-center justify-between p-6 lg:px-8">
        <div className="lg:flex lg:flex-1 lg:justify-end">
          <Link
            to="/logout"
            className="text-sm font-semibold leading-6 text-gray-900"
          >
            Log out <span aria-hidden="true">&rarr;</span>
          </Link>
        </div>
      </nav>
    </header>
  );
}

export default Header;
