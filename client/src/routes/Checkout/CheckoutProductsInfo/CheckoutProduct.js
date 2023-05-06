import { formatCurrency } from "helpers";
import { useDownloadImage } from "hooks";
import React, { useState, useEffect } from "react";

import { getColorNameById } from "services/colors";

const CheckoutProduct = ({ product }) => {
  const imageName = product.images[product.added.colorId][0].url;
  const { url } = useDownloadImage(imageName);

  const [colorName, setColorName] = useState("");

  useEffect(() => {
    const controller = new AbortController();

    getColorNameById(product.added.colorId, { signal: controller.signal })
      .then((name) => {
        setColorName(name);
      })
      .catch((err) => {
        console.log(err);
      });

    return () => {
      controller.abort();
    };
  }, [product.added.colorId]);

  return (
    <div className="checkout__product flex-start">
      <div className="image grey-bg" style={{ width: 50, height: 50 }}>
        {(url || imageName) && <img src={url || imageName} alt="" />}
      </div>
      <div className="checkout__product-info">
        <div className="productName">{product.product_name}</div> <br />
        <div className="otherInfo">
          Style #: DH0927-002
          <br />
          Size: {product.added.size.size}
          <br />
          Color: <span className="capitalized-text">{colorName}</span>
          <br />
          Qty: {product.added.quantity} @ {formatCurrency(product.price)}
          <span className="small-font"> VND</span>
          <br />
          {formatCurrency(product.price * product.added.quantity)}
          <span className="small-font"> VND</span>
          <br />
        </div>
      </div>
    </div>
  );
};
export default CheckoutProduct;
