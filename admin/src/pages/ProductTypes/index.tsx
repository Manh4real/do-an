import React, { useState, useEffect, useMemo } from "react";
import { Link, useSearchParams } from "react-router-dom";

import { ArrowLeft, ArrowRight } from "../../Icons";
import ProductTypeTableRow from "./ProductTypeTableRow";

import { getProductTypeList } from "../../services/product_types";

import { IProductType } from "../../types";
import AddProductTypeButton from "./AddProductTypeButton";
import { RefreshContextProvider } from "../../context";
// import UserSearch from "./UserSearch";
// import { useExportToPDF } from "../../hooks";
// import ExportButton from "../../components/ExportButton";
import RefreshButton from "../../components/RefreshButton";
import Spinner from "../../components/Spinner";

interface ITotal {
  page: number;
  types: number;
}

const TYPES_PER_PAGE = 4;
const cachedProductTypes = new Map();
function ProductTypes() {
  const [types, setTypes] = useState<IProductType[]>([]);
  const [loading, setLoading] = useState(false);

  const [searchParams] = useSearchParams();
  const [total, setTotal] = useState<ITotal>({ page: 1, types: 0 });

  const currentPage = Number(searchParams.get("page")) || 1;
  const q = searchParams.get("q");
  const totalPage = total.page;
  const totalTypes = total.types;

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

  // EXPORT TO PDF FILE
  //#region
  // const { container, exportPDFWithMethod } = useExportToPDF({
  //   title: `User Records for ${new Date().getFullYear()}`,
  //   fileName: `User Records for ${new Date().getFullYear()}`,
  // });
  //#endregion

  useEffect(() => {
    let ignore = false;

    if (refresh) {
      setLoading(true);
      getProductTypeList(currentPage)
        .then((data) => {
          if (!ignore) {
            setTypes(data.data.types);
            setTotal({
              types: data.total,
              page: data.meta.pagination.total_page,
            });

            cachedProductTypes.set(currentPage, data.data.types);
            cachedProductTypes.set("total", {
              page: data.meta.pagination.total_page,
              types: data.total,
            });
          }
        })
        .finally(() => {
          setRefresh(false);
          setLoading(false);
        });
    }
    // else if (q !== null) {
    //   setLoading(true);
    //   searchUsers(q)
    //     .then((data) => {
    //       if (ignore) return;

    //       setTypes(data.data.types);
    //       setTotal({
    //         types: data.total,
    //         page: data.meta.pagination.total_page,
    //       });
    //     })
    //     .finally(() => {
    //       setLoading(false);
    //     });
    // }
    else {
      if (cachedProductTypes.get(currentPage)) {
        setTypes(cachedProductTypes.get(currentPage));
        setTotal(cachedProductTypes.get("total"));
        console.log("Get cached types of page " + currentPage);
      } else {
        setLoading(true);
        getProductTypeList(currentPage)
          .then((data) => {
            if (!ignore) {
              setTypes(data.data.types);
              setTotal({
                types: data.total,
                page: data.meta.pagination.total_page,
              });

              if (!cachedProductTypes.get(currentPage)) {
                cachedProductTypes.set(currentPage, data.data.types);
              }
              if (!cachedProductTypes.get("total")) {
                cachedProductTypes.set("total", {
                  page: data.meta.pagination.total_page,
                  types: data.total,
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

  return (
    <RefreshContextProvider value={refreshContextValue}>
      <section className="container px-4 mx-auto mb-10">
        <div className="flex justify-between px-2">
          <div className="flex items-center gap-x-3">
            <h2 className="uppercase text-lg font-bold text-gray-800">
              Product types
            </h2>
            <span className="upp px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
              {totalTypes} types
            </span>
            {/* <UserSearch /> */}
            <RefreshButton
              handleClick={() => {
                setRefresh(true);
              }}
            />
          </div>
          <div className="flex items-center gap-2">
            {/* <ExportButton exportPDFWithMethod={exportPDFWithMethod} /> */}
            <AddProductTypeButton />
          </div>
        </div>
        <div className="flex flex-col mt-6">
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
                          <span>Product Type Name</span>
                        </div>
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
                    {!loading && types.length === 0 && (
                      <tr>
                        <td>No types found.</td>
                      </tr>
                    )}
                    {!loading &&
                      types.map((type, i) => {
                        return (
                          <ProductTypeTableRow
                            key={i}
                            // nth={(currentPage - 1) * USERS_PER_PAGE + (i + 1)}
                            type={type}
                          />
                        );
                      })}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        {currentPage > totalPage ? (
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
              <span>previous</span>
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
                (currentPage + 1 > totalPage
                  ? disabledClasses
                  : "text-gray-700")
              }
            >
              <span>Next</span>
              <ArrowRight />
            </Link>
          </div>
        )}
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

export default ProductTypes;
