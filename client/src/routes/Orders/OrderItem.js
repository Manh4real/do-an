import { getDownloadImage } from "features/firebase";
import { formatCurrency } from "helpers";
import React, { useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { stringifyDate } from "script";

const ORDER_STATUS = {
  prepared: "prepared",
  ready: "ready",
  canceled: "canceled",
  delivering: "delivering",
  delivered: "delivered",
  done: "done",
};

function OrderItem({ orderItem }) {
  const productLink = `/products/${orderItem.product_id}/${orderItem.color_id}`;

  const colorId = orderItem.color_id;
  const imageName = orderItem.product.images[colorId][0].url;

  const [url, setUrl] = useState(imageName);

  useEffect(() => {
    getDownloadImage(imageName)
      .then((url) => {
        setUrl(url);
      })
      .catch((err) => {
        console.log(err);
      });
  }, [imageName]);

  let statusColor = "green-font";

  if (ORDER_STATUS.canceled === orderItem.order_status_name) {
    statusColor = "red-font";
  } else if (ORDER_STATUS.prepared === orderItem.order_status_name) {
    statusColor = "orange-font";
  } else if (ORDER_STATUS.ready === orderItem.order_status_name) {
    statusColor = "blue-font";
  } else if (ORDER_STATUS.delivering === orderItem.order_status_name) {
    statusColor = "orange-font";
  }

  return (
    <div className="grid-item">
      <p className="ml-auto mb-10 w-max">
        <strong>Est. Arrived Date:</strong>{" "}
        {stringifyDate(new Date(orderItem.est_arrived_date), true, false, true)}
      </p>
      <div className="container flex-spbw">
        <div className="left flex-start flex-1">
          <Link to={productLink} className="image grey-bg">
            <img
              src={url || orderItem.image}
              alt={orderItem.product.product_name}
            />
          </Link>
          <div className="info flex-1">
            <div className="mb-25">
              <div
                className={
                  "orderItem-status " + statusColor + " capitalized-text"
                }
              >
                {orderItem.order_status_name}
              </div>
              <div className="product-name black-font">
                {orderItem.product.product_name}
              </div>
            </div>
            <div className="product-color grey-font capitalized-text mb-25">
              {orderItem.color_name}
            </div>
            <div className="product-size grey-font">Size: {orderItem.size}</div>
            <div className="product-quantity mt-10">
              &times; {orderItem.quantity}
            </div>
            <span className="bigger-font green-font">
              VND {formatCurrency(Number(orderItem.product.price))}
            </span>
          </div>
        </div>
        <div className="right flex-column">
          <Link to={productLink} className="btn medium-button cta">
            {orderItem.status === ORDER_STATUS.done
              ? "Re-order"
              : "View product"}
          </Link>
          <Link to="/" className="btn medium-button grey-border">
            Manage
          </Link>
          <Link to="/shop" className="btn medium-button grey-border">
            See related products
          </Link>
        </div>
      </div>
    </div>
  );
}

export default OrderItem;
