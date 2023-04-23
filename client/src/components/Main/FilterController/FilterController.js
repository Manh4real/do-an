import React, {
  useRef,
  useReducer,
  useState,
  useEffect,
  useCallback,
  useMemo,
} from "react";
import { useParams, useSearchParams } from "react-router-dom";

import FilterContainer from "./FilterContainer";
import ProductList from "../ProductList";
import SearchProductList from "../SearchProductList";
import FilterContext from "./context";
import { ProductListTitle } from "../ProductListTitle";

import { ThinnerArrowIcon } from "components/Icons";

import { getProducts } from "services/products";
import { reducer } from "./reducer";

const initialState = { gender: undefined, price: undefined };

function FilterController(props) {
  const [searchParams] = useSearchParams();

  const [filter, dispatch] = useReducer(reducer, initialState);
  const [list, setList] = useState([]);
  const [loading, setLoading] = useState(true);

  const { productType = "" } = useParams();

  const getSortedProducts = useCallback(
    (list) => {
      let sort = searchParams.get("sort");
      if (!sort) return list;

      const newList = [...list];

      switch (sort) {
        case "priceAsc":
          newList.sort((a, b) => a.price - b.price);
          break;
        case "priceDesc":
          newList.sort((a, b) => b.price - a.price);
          break;
        case "featured":
        case "newest":
          return list;
        default:
          // return list;
          throw new Error("Can't sort products!");
      }

      return newList;
    },
    [searchParams]
  );

  const filterProducts = useCallback(
    (list) => {
      const gender = searchParams.get("gender");
      const minPrice = searchParams.get("minPrice");
      const maxPrice = searchParams.get("maxPrice");
      const ratings = searchParams.getAll("rating");

      if (
        !gender &&
        !productType &&
        minPrice === null &&
        maxPrice === null &&
        ratings.length === 0
      )
        return getSortedProducts(list);

      function isOfFilter(product) {
        let c = true;

        if (productType) {
          c = product.type.trim() === productType.trim();
        }

        if (gender) c = gender.trim() === product["gender"].trim() && c;
        if (ratings.length > 0)
          c =
            c &&
            ratings.includes(Math.floor(product.average_rating).toString());

        let checkPrice = true;

        if (minPrice !== null && maxPrice !== null) {
          checkPrice = product.price >= minPrice && product.price <= maxPrice;
        } else if (minPrice !== null && maxPrice === null) {
          checkPrice = product.price >= minPrice;
        } else if (maxPrice !== null && minPrice === null) {
          checkPrice = product.price <= maxPrice;
        }

        return c && checkPrice;
      }

      const o = list.filter(isOfFilter);

      return getSortedProducts(o);
    },
    [getSortedProducts, productType, searchParams]
  );

  const filteredList = useMemo(
    () => filterProducts(list),
    [filterProducts, list]
  );

  //
  useEffect(() => {
    if (filteredList.length <= 10) {
      window.scrollTo(0, 0);
    }
  }, [filteredList.length]);

  return (
    <FilterContext.Provider
      value={{
        list: filteredList,
        loading,
        filter,
        dispatch,
        productsNum: filteredList.length,
      }}
    >
      <div className="main-content-ctn">
        <ProductListTitle {...props} />
        <div className="main-content-ctn-ctn">
          <div className="main-product-list-ctn">
            <FilterContainer {...props} />
            {searchParams.get("search") ? (
              <SearchProductList
                loading={loading}
                setLoading={setLoading}
                setList={setList}
              />
            ) : (
              <RegularProductList
                loading={loading}
                setLoading={setLoading}
                setList={setList}
              />
            )}
          </div>
        </div>
      </div>
    </FilterContext.Provider>
  );
}

const RegularProductList = React.memo(({ loading, setLoading, setList }) => {
  const [page, setPage] = useState(1);
  const [end, setEnd] = useState(false);
  const previousPageRef = useRef(0); // avoids to re-call api at (1)

  useEffect(() => {
    const controller = new AbortController();

    if (previousPageRef.current !== page) {
      setLoading(true);
      // (1)
      getProducts(page, { signal: controller.signal })
        .then((products) => {
          if (products.length < 10) {
            setEnd(true);
          }
          if (page === 1) {
            setList(products);
          } else {
            setList((prev) => [...prev, ...products]);
          }
        })
        .finally(() => {
          setLoading(false);
          previousPageRef.current = page;
        });
    }

    return () => {
      controller.abort();
    };
  }, [page, setLoading, setList]);

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
});

export default FilterController;
