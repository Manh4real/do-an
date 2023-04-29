import React, { useRef } from "react";
import { useSearchParams } from "react-router-dom";

// interface Props {
// }

function ProductSearch() {
  const searchInputRef = useRef<HTMLInputElement>(null);
  const [searchParams, setSearchParams] = useSearchParams();

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    if (!searchInputRef.current) return;

    const q = searchInputRef.current.value.trim();

    if (q === "") return;

    setSearchParams([...Object.entries(searchParams), ["page", 1], ["q", q]]);
  };

  return (
    <form onSubmit={handleSubmit} className="ml-8">
      <label htmlFor="table-search" className="sr-only">
        Search
      </label>
      <div className="relative flex border border-gray-300 rounded-lg bg-gray-50">
        <button className="cursor-pointer rounded-l-lg border-r-2 border-gray-200 flex items-center p-2 pl-3 text-gray-500 active:bg-gray-100 focus:outline-blue-500">
          <svg
            className="w-5 h-5 dark:text-gray-400"
            aria-hidden="true"
            fill="currentColor"
            viewBox="0 0 20 20"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              fillRule="evenodd"
              d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
              clipRule="evenodd"
            ></path>
          </svg>
        </button>
        <input
          ref={searchInputRef}
          type="text"
          id="table-search"
          className="block bg-transparent rounded-r-lg p-2 text-sm text-gray-900 w-80 border-transparent focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="Search products by name"
          autoComplete="search-products"
        />
      </div>
    </form>
  );
}

export default ProductSearch;
