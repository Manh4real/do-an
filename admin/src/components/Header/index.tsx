import React from "react";

function Header() {
  return (
    <header className="bg-white">
      <nav className="container mx-auto flex items-center justify-between p-6 lg:px-8">
        <div className="lg:flex lg:flex-1 lg:justify-end">
          <a
            href="/logout"
            className="text-sm font-semibold leading-6 text-gray-900"
          >
            Log out <span aria-hidden="true">&rarr;</span>
          </a>
        </div>
      </nav>
    </header>
  );
}

export default Header;
