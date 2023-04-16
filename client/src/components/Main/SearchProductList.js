import React, { useRef, useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";

import ProductList from "./ProductList";
import { ThinnerArrowIcon } from "components/Icons";

import { searchProductsByName } from "services/products";

const SearchProductList = ({ loading, setLoading, setList }) => {
  const [searchParams] = useSearchParams();

  const currentSearchParams = useRef(searchParams.get("search"));

  const [page, setPage] = useState(1);
  const [end, setEnd] = useState(false);

  useEffect(() => {
    if (currentSearchParams.current !== searchParams.get("search")) {
      setPage(1);
    }
  }, [searchParams]);

  useEffect(() => {
    const controller = new AbortController();

    if (searchParams.get("search")) {
      setLoading(true);
      searchProductsByName(searchParams.get("search"), page, {
        signal: controller.signal,
      })
        .then((products) => {
          setList((prev) => {
            if (page === 1) return products;
            if (products.length === 0) return prev;
            return [...prev, ...products];
          });

          setEnd(products.length < 10);
        })
        .finally(() => {
          setLoading(false);
          currentSearchParams.current = searchParams.get("search");
        });
    }

    return () => {
      controller.abort();
    };
  }, [searchParams, page, setList, setLoading]);

  return (
    <React.Fragment>
      <ProductList />
      {!end && !loading && (
        <button
          className="font-14 underlined hover-w-fade flex-center"
          style={{
            position: "absolute",
            bottom: 0,
            right: "33.33%",
            translate: "-100%",
          }}
          onClick={() => {
            setPage((prev) => prev + 1);
          }}
        >
          Show more <ThinnerArrowIcon w={24} h={24} />
        </button>
      )}
    </React.Fragment>
  );
};

export default SearchProductList;
