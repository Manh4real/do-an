import React, { useState } from "react";

import ProductDetailsModal from "./ProductDetailsModal";

const ViewProductDetails = ({ product }) => {
  const [show, setShow] = useState(false);

  const handleClick = () => {
    setShow(true);
  };
  const handleClose = (e) => {
    e.stopPropagation();
    setShow(false);
  };

  return (
    <div>
      <button
        className="underlined hover-w-fade"
        style={{ fontSize: 15 }}
        onClick={handleClick}
      >
        View Product Details
      </button>
      {show && (
        <ProductDetailsModal product={product} handleClose={handleClose} />
      )}
    </div>
  );
};

export default ViewProductDetails;
