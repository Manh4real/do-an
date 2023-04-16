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
      <div className="image" style={{ width: 50 }}>
        <img src={url || imageName} alt="" />
      </div>
      <div className="checkout__product-info">
        <div className="productName">{product.product_name}</div> <br />
        <div className="otherInfo">
          Style #: DH0927-002
          <br />
          Size: {product.added.size}
          <br />
          Color: {colorName}
          <br />
          Qty: {product.added.quantity} @ ${product.price.toFixed(2)}
          <br />${(product.price * product.added.quantity).toFixed(2)}
          <br />
        </div>
      </div>
    </div>
  );
};
export default CheckoutProduct;
