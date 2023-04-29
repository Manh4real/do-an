import React, { useEffect, useMemo, useState } from "react";
import InventoryTableRow from "./InventoryTableRow";
import { IProductInventory } from "../../types";
import { getStocks } from "../../services/misc";
import { Link, useSearchParams } from "react-router-dom";
import { ArrowLeft, ArrowRight } from "../../Icons";

function Inventory() {
  const [stocks, setStocks] = useState<IProductInventory>({});
  //   const [searchParams] = useSearchParams();
  const [total, setTotal] = useState({
    //   pages: 0,
    stocks: 0,
  });
  //
  //   const currentPage = !searchParams.get("page")
  //     ? 1
  //     : Number(searchParams.get("page")) || 1;
  //   const disabledClasses = "text-gray-300 pointer-events-none";
  //   const totalPage = total.pages;

  //   const pagination = useMemo(() => {
  //     return currentPage > totalPage ? (
  //       ""
  //     ) : (
  //       <div className="flex items-center justify-between mt-6 lg:px-2">
  //         <Link
  //           to={"?page=" + (currentPage - 1 > 1 ? currentPage - 1 : 1)}
  //           className={
  //             "flex items-center px-5 py-2 text-sm capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 " +
  //             (currentPage - 1 < 1 ? disabledClasses : "text-gray-700")
  //           }
  //         >
  //           <ArrowLeft />

  //           <span>Previous</span>
  //         </Link>

  //         <div className="items-center hidden lg:flex gap-x-3">
  //           {new Array(totalPage).fill(1).map((_, i) => {
  //             return (
  //               <PageNumber
  //                 key={i}
  //                 number={i + 1}
  //                 active={i + 1 === currentPage}
  //               />
  //             );
  //           })}
  //         </div>

  //         <Link
  //           to={
  //             "?page=" +
  //             (currentPage + 1 <= totalPage ? currentPage + 1 : currentPage)
  //           }
  //           className={
  //             "flex items-center px-5 py-2 text-sm capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 " +
  //             (currentPage + 1 > totalPage ? disabledClasses : "text-gray-700")
  //           }
  //         >
  //           <span>Next</span>

  //           <ArrowRight />
  //         </Link>
  //       </div>
  //     );
  //   }, [currentPage, totalPage]);

  useEffect(() => {
    getStocks().then((data) => {
      setStocks(data.data.stocks);
      setTotal({
        //   pages: data.meta.pagination.total_page || 0,
        stocks: data.total || 0,
      });
    });
  }, []);

  return (
    <section className="container px-4 mx-auto mb-10">
      <div className="flex justify-between px-2">
        <div className="flex items-center gap-x-3">
          <h2 className="uppercase text-lg font-bold text-gray-800">
            Inventories
          </h2>
          <span className="font-bold px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
            {total.stocks}
          </span>
          {/* <ProductSearch /> */}
          {/* <RefreshButton
          handleClick={() => {
            setRefresh(true);
          }}
        /> */}
        </div>
        <div className="flex items-center gap-2">
          {/* <ExportButton exportPDFWithMethod={exportPDFWithMethod} /> */}
          {/* <AddProductButton /> */}
        </div>
      </div>

      <div className="flex flex-col mt-6 min-h-[400px]">
        <div className="-mx-4 -my-2 overflow-x-auto">
          <div className="inline-block min-w-full py-2 align-middle md:px-4 lg:px-6">
            <div
              // ref={container}
              className="overflow-hidden border border-gray-200 md:rounded-lg"
            >
              <table className="min-w-full divide-y divide-gray-200">
                <thead className="bg-gray-50">
                  <tr>
                    <th
                      scope="col"
                      className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      ID
                    </th>
                    <th
                      scope="col"
                      className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      <div className="flex items-center gap-x-3">
                        Product Name
                      </div>
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Type
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Gender
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Created at
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Price
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Color
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Sizes
                    </th>
                    <th
                      scope="col"
                      className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                    >
                      Total Stock
                    </th>
                    <th scope="col" className="relative py-3.5 px-4">
                      <span className="sr-only">Edit</span>
                    </th>
                  </tr>
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {/* {loading && (
                  <tr>
                    <td>
                      <Spinner />
                    </td>
                  </tr>
                )}
                {!loading && products.length === 0 && (
                  <tr>
                    <td>No products found.</td>
                  </tr>
                )} */}
                  {Object.entries(stocks)
                    .sort(([product1Id], [product2Id]) =>
                      +product1Id < +product2Id ? 1 : -1
                    )
                    .map(([product_id, product]) => {
                      return (
                        <InventoryTableRow
                          key={product_id}
                          // nth={
                          //   (currentPage - 1) * PRODUCTS_PER_PAGE + (i + 1)
                          // }
                          product={product}
                        />
                      );
                    })}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      {/* {pagination} */}
    </section>
  );
}

// const PageNumber = ({
//   number,
//   active = false,
// }: {
//   number: number;
//   active?: boolean;
// }) => {
//   return (
//     <Link
//       to={"?page=" + number}
//       className={
//         active
//           ? "px-2 py-1 text-sm text-blue-500 rounded-md bg-blue-100/60"
//           : "px-2 py-1 text-sm text-gray-500 rounded-md hover:bg-gray-100"
//       }
//     >
//       {number}
//     </Link>
//   );
// };

export default Inventory;
