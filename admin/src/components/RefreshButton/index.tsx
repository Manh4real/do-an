import React from "react";
import { RefreshIcon } from "../../Icons";

interface Props {
  handleClick: () => void;
}
function RefreshButton({ handleClick }: Props) {
  return (
    <button
      title="Refresh"
      onClick={handleClick}
      className="ring-gray-300 text-gray-800 ring-1 rounded p-1.5 hover:bg-gray-100 focus:outline-blue-500"
    >
      <RefreshIcon />
      <span className="sr-only">Refresh</span>
    </button>
  );
}

export default RefreshButton;
