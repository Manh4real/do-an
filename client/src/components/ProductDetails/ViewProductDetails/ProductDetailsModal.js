import React from "react";

import { toModalRoot } from "components";
import { CloseIcon } from "components/Icons";

import StyledProductDetailsModal from "./StyledProductDetailsModal";
import { formatCurrency } from "helpers";

const ProductDetailsModal = ({ product, handleClose }) => {
  const image = product.images[Object.keys(product.images)[0]][0].url;

  return (
    <StyledProductDetailsModal onClick={handleClose}>
      <div
        className="product-details-modal"
        onClick={(e) => e.stopPropagation()}
      >
        <header className="flex-start">
          <div className="image">
            <img
              src={image}
              width="75"
              height="75"
              alt={product.product_name}
            />
          </div>
          <div className="regular-font">
            <div className="capitalized-text">{product.product_name}</div>
            <div className="price">
              {formatCurrency(product.price)}
              <span style={{ fontSize: 12 }}> VND</span>
            </div>
          </div>
        </header>
        <main>
          <p>{product.description}</p>
        </main>

        <div className="close-btn-ctn" onClick={handleClose}>
          <button>
            <CloseIcon w={12} h={12} />
          </button>
        </div>
      </div>
    </StyledProductDetailsModal>
  );
};

export default toModalRoot(ProductDetailsModal);
