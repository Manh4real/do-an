import React, { useEffect, useMemo, useState } from "react";
import { RefreshContextProvider } from "../../context";
import RefreshButton from "../../components/RefreshButton";
import { getReviews } from "../../services/reviews";
import { Link, useSearchParams } from "react-router-dom";
import { ArrowLeft, ArrowRight } from "../../Icons";
import PageNumber from "../../components/PageNumber";
import { IReview } from "../../types";
import ReviewTableRow from "./ReviewTableRow";
import Spinner from "../../components/Spinner";

interface ITotal {
  page: number;
  reviews: number;
}
const REVIEWS_PER_PAGE = 10;

function Reviews() {
  const [reviews, setReviews] = useState<IReview[]>([]);
  const [loading, setLoading] = useState(false);

  const [searchParams] = useSearchParams();
  const [total, setTotal] = useState<ITotal>({ page: 1, reviews: 0 });

  const currentPage = Number(searchParams.get("page")) || 1;
  const q = searchParams.get("q"); // search query string
  const totalPage = total.page;
  const totalReviews = total.reviews;

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
      getReviews(currentPage)
        .then((data) => {
          setReviews(data.data.reviews);
          setTotal({
            page: data.meta.pagination.total_page,
            reviews: data.total,
          });
        })
        .finally(() => {
          setLoading(false);
          setRefresh(false);
        });
    } else {
      setLoading(true);
      getReviews(currentPage)
        .then((data) => {
          setReviews(data.data.reviews);
          setTotal({
            page: data.meta.pagination.total_page,
            reviews: data.total,
          });
        })
        .finally(() => {
          setLoading(false);
        });
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
              Reviews
            </h2>
            <span className="upp px-3 py-1 text-xs text-blue-600 bg-blue-100 rounded-full ">
              {totalReviews} reviews
            </span>
            {/* <OrderSearch /> */}
            <RefreshButton
              handleClick={() => {
                setRefresh(true);
              }}
            />
          </div>
          {/* <div className="flex items-center gap-2">
          <ExportButton exportPDFWithMethod={exportPDFWithMethod} />
        </div> */}
        </div>
        <div className="flex flex-col mt-6">
          {pagination}

          <div className="-mx-4 my-2 overflow-x-auto">
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
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500 w-12"
                      >
                        #
                      </th>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <div className="flex items-center gap-x-3">
                          <span>Product</span>
                          {/* <SortIcon /> */}
                        </div>
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <button className="flex items-center gap-x-2">
                          <span>Reviewer</span>
                        </button>
                      </th>
                      <th
                        scope="col"
                        className="py-3.5 px-4 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        <div className="flex items-center gap-x-3">
                          <span>Review</span>
                        </div>
                      </th>
                      <th
                        scope="col"
                        className="px-4 py-3.5 text-sm font-medium text-left rtl:text-right text-gray-500"
                      >
                        Date
                      </th>
                      <th scope="col" className="relative py-3.5 px-4">
                        <span className="sr-only">Action</span>
                      </th>
                    </tr>
                  </thead>
                  <tbody className="bg-white divide-y divide-gray-200">
                    {loading && (
                      <tr>
                        <td>
                          <Spinner />
                        </td>
                      </tr>
                    )}
                    {!loading && reviews.length === 0 && (
                      <tr>
                        <td>No products found.</td>
                      </tr>
                    )}
                    {!loading &&
                      reviews.map((review, i) => {
                        return (
                          <ReviewTableRow
                            key={i}
                            nth={(currentPage - 1) * REVIEWS_PER_PAGE + (i + 1)}
                            review={review}
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

export default Reviews;
