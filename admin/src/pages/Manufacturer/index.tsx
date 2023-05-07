import React, { useState, useEffect, useMemo } from "react";
import { Link, useSearchParams } from "react-router-dom";

import { ArrowLeft, ArrowRight } from "../../Icons";
import ManufacturerTableRow from "./ManufacturerTableRow";

import { getManufacturers } from "../../services/manufacturers";

import { IManufacturer } from "../../types";
import AddManufacturerButton from "./AddManufacturerButton";
import { RefreshContextProvider } from "../../context";
// import UserSearch from "./UserSearch";
// import { useExportToPDF } from "../../hooks";
// import ExportButton from "../../components/ExportButton";
import RefreshButton from "../../components/RefreshButton";
import Spinner from "../../components/Spinner";

interface ITotal {
  page: number;
  manufacturers: number;
}

const MANUFACTURER_PER_PAGE = 4;
const cachedManufacturers = new Map();
function Manufacturers() {
  const [manufacturers, setManufacturers] = useState<IManufacturer[]>([]);
  const [loading, setLoading] = useState(false);

  const [searchParams] = useSearchParams();
  const [total, setTotal] = useState<ITotal>({ page: 1, manufacturers: 0 });

  const currentPage = Number(searchParams.get("page")) || 1;
  const q = searchParams.get("q");
  const totalPage = total.page;
  const totalManufacturers = total.manufacturers;

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
      getManufacturers(currentPage)
        .then((data) => {
          if (!ignore) {
            setManufacturers(data.data.manufacturers);
            setTotal({
              manufacturers: data.total,
              page: data.meta.pagination.total_page,
            });

            cachedManufacturers.set(currentPage, data.data.manufacturers);
            cachedManufacturers.set("total", {
              page: data.meta.pagination.total_page,
              manufacturers: data.total,
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

    //       setManufacturers(data.data.manufacturers);
    //       setTotal({
    //         manufacturers: data.total,
    //         page: data.meta.pagination.total_page,
    //       });
    //     })
    //     .finally(() => {
    //       setLoading(false);
    //     });
    // }
    else {
      if (cachedManufacturers.get(currentPage)) {
        setManufacturers(cachedManufacturers.get(currentPage));
        setTotal(cachedManufacturers.get("total"));
        console.log("Get cached manufacturers of page " + currentPage);
      } else {
        setLoading(true);
        getManufacturers(currentPage)
          .then((data) => {
            if (!ignore) {
              setManufacturers(data.data.manufacturers);
              setTotal({
                manufacturers: data.total,
                page: data.meta.pagination.total_page,
              });

              if (!cachedManufacturers.get(currentPage)) {
                cachedManufacturers.set(currentPage, data.data.manufacturers);
              }
              if (!cachedManufacturers.get("total")) {
                cachedManufacturers.set("total", {
                  page: data.meta.pagination.total_page,
                  manufacturers: data.total,
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
              Manufacturer
            </h2>
            <span className="upp px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
              {totalManufacturers} manufacturers
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
            <AddManufacturerButton />
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
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500 w-5"
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
                        <div className="flex items-center gap-x-3">
                          <span>Manufacturer Name</span>
                        </div>
                      </th>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <div className="flex items-center gap-x-3">
                          <span>Brand Name</span>
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
                    {!loading && manufacturers.length === 0 && (
                      <tr>
                        <td colSpan={4}>No manufacturers found.</td>
                      </tr>
                    )}
                    {!loading &&
                      manufacturers.map((manufacturer, i) => {
                        return (
                          <ManufacturerTableRow
                            key={i}
                            // nth={(currentPage - 1) * USERS_PER_PAGE + (i + 1)}
                            nth={i + 1}
                            manufacturer={manufacturer}
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

export default Manufacturers;
