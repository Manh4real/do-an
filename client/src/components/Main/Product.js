import React, { useRef, useEffect, useMemo, useState } from "react";
import clsx from "clsx";
import { Link } from "react-router-dom";

import styles from "./Product.module.css";

import ProductImages from "./ProductImages";
import { withEffect } from "./withEffect";

import { getDownloadImage } from "features/firebase";
import { formatCurrency } from "helpers";
import { Star } from "components/Icons";

const Product = ({ product, img, handleImageChange }) => {
  const {
    images,
    // category,
    categories,
    product_name,
    target,
    price,
    on_sale,
    old_price,
  } = product;

  const fullColorImages = useMemo(() => {
    const c = {};

    if (images) {
      Object.keys(images).forEach((i) => {
        if (!c[i]) {
          c[i] = images[i][0].url;
        }
      });
    }

    return c;
  }, [images]);
  const colorId = Object.keys(fullColorImages)[0];

  const [colors, setColors] = useState({});

  const myRef = useRef();

  const initialImage = colors[Object.keys(colors)[0]]; // first image of first color in color set.
  const colorNum = Object.keys(colors).length;

  useEffect(() => {
    const promises = [];
    const names = Object.keys(fullColorImages);
    const length = names.length;

    for (let i = 0; i < length; i++) {
      fullColorImages[names[i]] &&
        promises.push(getDownloadImage(fullColorImages[names[i]]));
    }

    Promise.all(promises).then((data) => {
      setColors((prevColors) => {
        const c = {};

        data.forEach((url, i) => {
          c[names[i]] = url;
        });

        return c;
      });
    });
  }, [fullColorImages]);

  return (
    <div ref={myRef} className={clsx(styles.product, "position-relative")}>
      {on_sale && (
        <div
          className={clsx(
            styles["sale-pct"],
            "position-absolute",
            "grey-border",
            "text-center"
          )}
        >
          {Math.round(100 - (price * 100) / old_price)}% <br /> off
        </div>
      )}
      <div className={clsx({ [styles.hasSomeImages]: colorNum > 1 })}>
        <Link
          to={`/products/${product.product_id}/${colorId}`}
          style={{ display: "flex", minHeight: 300 }}
        >
          <div className={styles.image}>
            <img src={img || initialImage} alt="" />
          </div>
        </Link>
        <div className={styles.title}>
          {Object.keys(colors).length > 1 && (
            <ProductImages
              activeImage={img}
              handleImageChange={handleImageChange}
              images={colors}
            />
          )}
          <Link
            to={`/products/${product.product_id}/${colorId}`}
            className="flex-column-nogap"
          >
            {/* {category && <div className={styles.category}>{category}</div>} */}
            <div className={styles.category}>
              {categories.map((c) => c.category_name).join(" / ")}
            </div>
            <div className={clsx(styles["pd-name"], "capitalized-text")}>
              {product.brand_name} &minus; {product_name}
            </div>
            <div className={styles["pd-tgObj"]}>{target}</div>
            <div className={styles.colorNum}>
              {colorNum}&nbsp;
              {colorNum <= 1 ? "color" : "colors"}
            </div>
            <div
              className={clsx(
                styles.price,
                "flex-column mt-auto w-100 position-absolute"
              )}
            >
              <div className="flex-start text-left">
                <span className="flex-inline-center">
                  {Math.floor(product.average_rating)}
                  <Star width={12} height={12} />
                </span>
                <span className="small-font grey-font">
                  ({product.total_reviews} reviews)
                </span>
              </div>
              <div className="flex-start">
                <span>
                  {formatCurrency(price)}
                  <span className="small-font"> &nbsp;VND</span>
                </span>
                {on_sale && (
                  <del className="small-font grey-font">
                    {formatCurrency(old_price)}
                    &nbsp;VND
                  </del>
                )}
              </div>
            </div>
          </Link>
        </div>
      </div>
    </div>
  );
};

const ProductWithEffect = withEffect(Product);

export { ProductWithEffect };
export default Product;
