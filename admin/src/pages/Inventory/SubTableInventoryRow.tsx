import React, { useState } from "react";
import { IColor } from "../../types";
import { updateStock } from "../../services/misc";

interface Props {
  color: IColor;
}

function SubTableInventoryRow({ color }: Props) {
  const [activeSize, setActiveSize] = useState(color.sizes[0]);

  const activeClasses = "ring-2 ring-indigo-800";
  const normalClasses = "ring-1 ring-gray-300";

  return (
    <tr>
      <td className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
        <span className="capitalize">{color.color_name}</span>
      </td>
      <td className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
        <div className="flex gap-2 flex-wrap">
          {color.sizes.map((stock) => (
            <div
              key={stock.color_id + stock.size_id}
              onClick={() => {
                setActiveSize(stock);
              }}
              onKeyUp={(e) => {
                e.preventDefault();

                if (e.key === "Enter" || e.key === " ") {
                  setActiveSize(stock);
                }
              }}
              tabIndex={0}
              className={
                (stock.stock_id === activeSize.stock_id
                  ? activeClasses
                  : normalClasses) +
                " cursor-pointer p-1 rounded w-7 h-7 text-xs font-medium flex justify-center items-center"
              }
            >
              {stock.size}
            </div>
          ))}
        </div>
      </td>
      <StockInput
        key={activeSize.stock_id}
        stock_id={activeSize.stock_id}
        initialQuantity={activeSize.quantity}
      />
    </tr>
  );
}

interface StockInputProps {
  initialQuantity: number;
  stock_id: string;
}
const StockInput = ({ initialQuantity, stock_id }: StockInputProps) => {
  const [quantity, setQuantity] = useState(initialQuantity);

  const handleUpdate = () => {
    if (quantity < 0) return;

    updateStock(quantity, stock_id).then((result) => {
      alert(
        result
          ? `Updated stock #${stock_id}`
          : `Failed to update stock #${stock_id}`
      );
    });
  };

  const isQuantityNagitive = quantity < 0;

  return (
    <>
      <td className="relative px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
        <input
          type="number"
          name="quantity"
          id="quantity"
          className={
            (isQuantityNagitive
              ? "ring-red-500 ring-1 focus:ring-primary-600 focus:border-primary-600"
              : "focus:ring-primary-600 focus:border-primary-600") +
            " bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
          }
          placeholder="0"
          required
          value={quantity}
          onChange={(e) => {
            setQuantity(Number(e.target.value) || 0);
          }}
        />
        {isQuantityNagitive && (
          <p className="absolute bottom-3 translate-y-full text-red-500 text-xs">
            Quantity must be positive number
          </p>
        )}
      </td>
      <td className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500">
        <button
          onClick={handleUpdate}
          type="button"
          disabled={isQuantityNagitive}
          className="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-md text-xs px-4 py-2 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800 disabled:opacity-40 disabled:pointer-events-none"
        >
          Update stock
        </button>
      </td>
    </>
  );
};

export default SubTableInventoryRow;
