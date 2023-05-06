import React, { useState, useEffect, useMemo } from "react";
import { Link, useSearchParams } from "react-router-dom";

import { ArrowLeft, ArrowRight, InfoIcon, SortIcon } from "../../Icons";
import ProductTableRow from "./ProductTableRow";

import { getProducts, searchProducts } from "../../services/products";

import { IProduct } from "../../types";
import AddProductButton from "./AddProductButton";
import { RefreshContextProvider } from "../../context";
import ProductSearch from "./ProductSearch";
import { useExportToPDF } from "../../hooks";
import ExportButton from "../../components/ExportButton";
import Spinner from "../../components/Spinner";
import RefreshButton from "../../components/RefreshButton";

interface ITotal {
  page: number;
  products: number;
}

const PRODUCTS_PER_PAGE = 10;

const cachedProducts = new Map();

function Products() {
  const [refresh, setRefresh] = useState(false);
  const [products, setProducts] = useState<IProduct[]>([]);
  const [loading, setLoading] = useState(false);

  const [searchParams] = useSearchParams();
  const [total, setTotal] = useState<ITotal>({ page: 1, products: 0 });

  const currentPage = Number(searchParams.get("page")) || 1;
  const q = searchParams.get("q"); // search query string
  const totalPage = total.page;
  const totalProducts = total.products;

  const disabledClasses = "text-gray-300 pointer-events-none";

  // EXPORT TO PDF FILE
  //#region
  const { container, exportPDFWithMethod } = useExportToPDF({
    title: `Product Records for ${new Date().getFullYear()}`,
    fileName: `Product Records for ${new Date().getFullYear()}`,
  });
  //#endregion

  useEffect(() => {
    let ignore = false;

    if (refresh) {
      setLoading(true);
      getProducts(currentPage)
        .then((data) => {
          if (!ignore) {
            setProducts(data.data.products);
            setTotal({
              products: data.total,
              page: data.meta.pagination.total_page,
            });

            cachedProducts.set(currentPage, data.data.products);
            cachedProducts.set("total", {
              page: data.meta.pagination.total_page,
              products: data.total,
            });
          }
        })
        .finally(() => {
          setRefresh(false);
          setLoading(false);
        });
    } else if (q !== null) {
      setLoading(true);
      searchProducts(q.toString().trim())
        .then((data) => {
          setProducts(data.data.products);
          setTotal({
            products: data.total,
            page: data.meta.pagination.total_page,
          });
        })
        .finally(() => {
          setLoading(false);
        });
    } else {
      if (cachedProducts.get(currentPage)) {
        setProducts(cachedProducts.get(currentPage));
        setTotal(cachedProducts.get("total"));
        console.log("Get cached products of page " + currentPage);
      } else {
        setLoading(true);
        getProducts(currentPage)
          .then((data) => {
            if (!ignore) {
              setProducts(data.data.products);
              setTotal({
                products: data.total,
                page: data.meta.pagination.total_page,
              });

              if (!cachedProducts.get(currentPage)) {
                cachedProducts.set(currentPage, data.data.products);
              }
              if (!cachedProducts.get("total")) {
                cachedProducts.set("total", {
                  page: data.meta.pagination.total_page,
                  products: data.total,
                });
              }
            }
          })
          .finally(() => {
            setLoading(false);
          });
      }
    }

    return () => {
      ignore = true;
    };
  }, [currentPage, refresh, q]);

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

  const refreshContextValue = useMemo(() => {
    return {
      handleRefresh: () => {
        setRefresh(true);
      },
      refresh,
    };
  }, [refresh]);

  return (
    <RefreshContextProvider value={refreshContextValue}>
      <section className="container px-4 mx-auto mb-10">
        <div className="flex justify-between px-2">
          <div className="flex items-center gap-x-3">
            <h2 className="uppercase text-lg font-bold text-gray-800">
              Products
            </h2>
            <span className="px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
              {totalProducts} products
            </span>
            <ProductSearch />
            <RefreshButton
              handleClick={() => {
                setRefresh(true);
              }}
            />
          </div>
          <div className="flex items-center gap-2">
            <ExportButton exportPDFWithMethod={exportPDFWithMethod} />
            <AddProductButton />
          </div>
        </div>
        {pagination}
        <div className="flex flex-col mt-6 min-h-[400px]">
          <div className="-mx-4 -my-2 overflow-x-auto">
            <div className="inline-block min-w-full py-2 align-middle md:px-4 lg:px-6">
              <div
                ref={container}
                className="overflow-hidden border border-gray-200 md:rounded-lg"
              >
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
                        <div className="flex items-center gap-x-3">
                          <span>Product Name</span>
                          <SortIcon />
                        </div>
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <button className="flex items-center gap-x-2">
                          <span>Gender</span>
                          <InfoIcon />
                        </button>
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        Target
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
                        Sizes
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
                        Description
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
                    {!loading && products.length === 0 && (
                      <tr>
                        <td>No products found.</td>
                      </tr>
                    )}
                    {!loading &&
                      products.map((product, i) => {
                        return (
                          <ProductTableRow
                            key={i}
                            nth={
                              (currentPage - 1) * PRODUCTS_PER_PAGE + (i + 1)
                            }
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

export default Products;
