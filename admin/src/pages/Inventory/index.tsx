import React, { useEffect, useMemo, useState } from "react";
import { useSearchParams, Link } from "react-router-dom";

import InventoryTableRow from "./InventoryTableRow";
import { IProductInventory } from "../../types";
import { getStocks } from "../../services/misc";
import RefreshButton from "../../components/RefreshButton";
import { RefreshContextProvider } from "../../context";
import { ArrowLeft, ArrowRight } from "../../Icons";
import Spinner from "../../components/Spinner";

const STOCKS_PER_PAGE = 10;
const cachedStocks = new Map();
function Inventory() {
  const [stocks, setStocks] = useState<IProductInventory>({});
  const [searchParams] = useSearchParams();
  const [total, setTotal] = useState({
    pages: 0,
    stocks: 0,
  });
  const [loading, setLoading] = useState(false);

  const currentPage = Number(searchParams.get("page")) || 1;
  const totalPage = total.pages;
  const totalStocks = total.stocks;

  const disabledClasses = "text-gray-300 pointer-events-none";

  const [refresh, setRefresh] = useState(false);
  const refreshContextValue = useMemo(() => {
    return {
      handleRefresh: () => {
        setRefresh(true);
      },
      refresh,
    };
  }, [refresh]);

  useEffect(() => {
    if (refresh) {
      setLoading(true);
      getStocks(currentPage)
        .then((data) => {
          setStocks(data.data.stocks);
          setTotal({
            pages: data.meta.pagination.total_page || 0,
            stocks: data.total || 0,
          });

          cachedStocks.set(currentPage, data.data.stocks);
          cachedStocks.set("total", {
            pages: data.meta.pagination.total_page,
            stocks: data.total,
          });
        })
        .finally(() => {
          setRefresh(false);
          setLoading(false);
        });
    } else {
      if (cachedStocks.get(currentPage)) {
        setStocks(cachedStocks.get(currentPage));
        setTotal(cachedStocks.get("total"));
        console.log("Get cached stocks of page " + currentPage);
      } else {
        setLoading(true);
        getStocks(currentPage)
          .then((data) => {
            setStocks(data.data.stocks);
            setTotal({
              pages: data.meta.pagination.total_page || 0,
              stocks: data.total || 0,
            });

            if (!cachedStocks.get(currentPage)) {
              cachedStocks.set(currentPage, data.data.stocks);
            }
            if (!cachedStocks.get("total")) {
              cachedStocks.set("total", {
                pages: data.meta.pagination.total_page,
                stocks: data.total,
              });
            }
          })
          .finally(() => {
            setLoading(false);
          });
      }
    }
  }, [refresh, currentPage]);

  const pagination = useMemo(() => {
    return currentPage > totalPage ? (
      ""
    ) : (
      <div className="flex items-center justify-between mt-6 lg:px-2">
        <Link
          to={"?page=" + (currentPage - 1 > 1 ? currentPage - 1 : 1)}
          className={
            "flex items-center px-5 py-2 text-sm capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 " +
            (currentPage - 1 < 1 ? disabledClasses : "text-gray-700")
          }
        >
          <ArrowLeft />

          <span>Previous</span>
        </Link>

        <div className="items-center hidden lg:flex gap-x-3">
          {new Array(totalPage).fill(1).map((_, i) => {
            return (
              <PageNumber
                key={i}
                number={i + 1}
                active={i + 1 === currentPage}
              />
            );
          })}
        </div>

        <Link
          to={
            "?page=" +
            (currentPage + 1 <= totalPage ? currentPage + 1 : currentPage)
          }
          className={
            "flex items-center px-5 py-2 text-sm capitalize transition-colors duration-200 bg-white border rounded-md gap-x-2 hover:bg-gray-100 " +
            (currentPage + 1 > totalPage ? disabledClasses : "text-gray-700")
          }
        >
          <span>Next</span>

          <ArrowRight />
        </Link>
      </div>
    );
  }, [currentPage, totalPage]);

  return (
    <RefreshContextProvider value={refreshContextValue}>
      <section className="container px-4 mx-auto mb-10">
        <div className="flex justify-between px-2">
          <div className="flex items-center gap-x-3">
            <h2 className="uppercase text-lg font-bold text-gray-800">
              Inventories
            </h2>
            <span className="font-bold px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
              {totalStocks}
            </span>
            {/* <ProductSearch /> */}
            <RefreshButton
              handleClick={() => {
                setRefresh(true);
              }}
            />
          </div>
          <div className="flex items-center gap-2"></div>
        </div>

        <div className="flex flex-col mt-6 min-h-[400px]">
          <div className="-mx-4 -my-2 overflow-x-auto">
            <div className="inline-block min-w-full py-2 align-middle md:px-4 lg:px-6">
              <div className="overflow-hidden border border-gray-200 md:rounded-lg">
                <table className="min-w-full divide-y divide-gray-200">
                  <thead className="bg-gray-50">
                    <tr>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        #
                      </th>
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
                        <div className="flex items-center gap-x-3">Product</div>
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
                    {loading && (
                      <tr>
                        <td>
                          <div className="m-auto w-max my-3">
                            <Spinner />
                          </div>
                        </td>
                      </tr>
                    )}
                    {!loading && Object.keys(stocks).length === 0 && (
                      <tr>
                        <td className="px-4 py-4 text-sm text-gray-700 whitespace-nowrap">
                          <div className="py-3 text-center">No stock found</div>
                        </td>
                      </tr>
                    )}
                    {Object.entries(stocks)
                      .sort(([product1Id], [product2Id]) =>
                        +product1Id < +product2Id ? 1 : -1
                      )
                      .map(([product_id, product], i) => {
                        return (
                          <InventoryTableRow
                            key={product_id}
                            nth={(currentPage - 1) * STOCKS_PER_PAGE + (i + 1)}
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

        {pagination}
      </section>
    </RefreshContextProvider>
  );
}

const PageNumber = ({
  number,
  active = false,
}: {
  number: number;
  active?: boolean;
}) => {
  return (
    <Link
      to={"?page=" + number}
      className={
        active
          ? "px-2 py-1 text-sm text-blue-500 rounded-md bg-blue-100/60"
          : "px-2 py-1 text-sm text-gray-500 rounded-md hover:bg-gray-100"
      }
    >
      {number}
    </Link>
  );
};

export default Inventory;
