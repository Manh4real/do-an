import React from "react";
import { ExportIcon } from "../../Icons";

interface Props {
  exportPDFWithMethod: () => void;
}
function ExportButton({ exportPDFWithMethod }: Props) {
  return (
    <button
      onClick={() => {
        exportPDFWithMethod();
      }}
      className="flex items-center ring-1 ring-gray-100 cursor-pointer gap-2 rounded-md px-3.5 py-2.5 text-sm font-semibold text-black shadow-sm hover:bg-gray-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"
    >
      <ExportIcon /> Export
    </button>
  );
}

export default ExportButton;
