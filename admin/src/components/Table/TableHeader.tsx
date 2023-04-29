import React from "react";

import { InfoIcon, SortIcon } from "../../Icons";

function TableHeader() {
  return (
    <tr>
      <th
        scope="col"
        className="py-3.5 px-4 text-sm font-normal text-left rtl:text-right text-gray-500"
      >
        <div className="flex items-center gap-x-3">
          <input
            type="checkbox"
            className="text-blue-500 border-gray-300 rounded "
          />
          <span>Name</span>
        </div>
      </th>

      <th
        scope="col"
        className="px-12 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500"
      >
        <button className="flex items-center gap-x-2">
          <span>Status</span>
          <SortIcon />
        </button>
      </th>

      <th
        scope="col"
        className="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500"
      >
        <button className="flex items-center gap-x-2">
          <span>Role</span>
          <InfoIcon />
        </button>
      </th>

      <th
        scope="col"
        className="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500"
      >
        Email address
      </th>

      <th
        scope="col"
        className="px-4 py-3.5 text-sm font-normal text-left rtl:text-right text-gray-500"
      >
        Teams
      </th>

      <th scope="col" className="relative py-3.5 px-4">
        <span className="sr-only">Edit</span>
      </th>
    </tr>
  );
}

export default TableHeader;
