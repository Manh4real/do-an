import React from "react";
import { EditIcon, TrashBinIcon } from "../../Icons";

function Row() {
  return (
    <tr>
      <td className="px-4 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
        <div className="inline-flex items-center gap-x-3">
          <input
            type="checkbox"
            className="text-blue-500 border-gray-300 rounded"
          />

          <div className="flex items-center gap-x-2">
            <img
              className="object-cover w-10 h-10 rounded-full"
              src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"
              alt=""
            />
            <div>
              <h2 className="font-medium text-gray-800">Arthur Melo</h2>
              <p className="text-sm font-normal text-gray-600">@authurmelo</p>
            </div>
          </div>
        </div>
      </td>
      <td className="px-12 py-4 text-sm font-medium text-gray-700 whitespace-nowrap">
        <div className="inline-flex items-center px-3 py-1 rounded-full gap-x-2 bg-emerald-100/60">
          <span className="h-1.5 w-1.5 rounded-full bg-emerald-500"></span>

          <h2 className="text-sm font-normal text-emerald-500">Active</h2>
        </div>
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        Design Director
      </td>
      <td className="px-4 py-4 text-sm text-gray-500 whitespace-nowrap">
        authurmelo@example.com
      </td>
      <td className="px-4 py-4 text-sm whitespace-nowrap">
        <div className="flex items-center gap-x-2">
          <p className="px-3 py-1 text-xs text-indigo-500 rounded-full bg-indigo-100/60">
            Design
          </p>
          <p className="px-3 py-1 text-xs text-blue-500 rounded-full bg-blue-100/60">
            Product
          </p>
          <p className="px-3 py-1 text-xs text-pink-500 rounded-full bg-pink-100/60">
            Marketing
          </p>
        </div>
      </td>
      <td className="px-4 py-4 text-sm whitespace-nowrap">
        <div className="flex items-center gap-x-6">
          <button className="text-gray-500 transition-colors duration-200 hover:text-red-500 focus:outline-none">
            <TrashBinIcon />
          </button>

          <button className="text-gray-500 transition-colors duration-200 hover:text-yellow-500 focus:outline-none">
            <EditIcon />
          </button>
        </div>
      </td>
    </tr>
  );
}

export default Row;
