import React, { useMemo } from "react";
import clsx from "clsx";

import { useFilterContext } from "./FilterController/context";

import Product, { ProductWithEffect } from "./Product";

import styles from "./ProductList.module.css";

function ProductList() {
  const { list, loading } = useFilterContext();

  // These lines below might be rebundant.
  const output = useMemo(() => {
    const getFinalProducts = (product) => {
      const props = {
        // key: Math.random(), // dont't get remembered each re-rendering
        key: product.product_id,
        product,
      };

      if (Object.keys(product.images).length > 1) {
        return <ProductWithEffect {...props} />;
      }
      return <Product {...props} />;
    };

    return list.map(getFinalProducts);
  }, [list]);

  return (
    <div className={styles["products-container"]}>
      <div className={styles.products} id={styles["product-list"]}>
        {list.length > 0 ? output : <Empty />}
      </div>
      <Loader isLoading={loading} />
    </div>
  );
}

const Loader = ({ isLoading }) => {
  return (
    <div
      className={clsx(styles.loader, { [styles["is--loading"]]: isLoading })}
    ></div>
  );
};

const Empty = () => <p className={styles["found-none"]}>No products found.</p>;

export default React.memo(ProductList);
