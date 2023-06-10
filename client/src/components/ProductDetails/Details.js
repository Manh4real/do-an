import React, { useState, useCallback, useMemo } from "react";
import { useParams } from "react-router-dom";

import ProductDetailsFooter from "./Footer";
// import Description from "./Description";
import Images from "./Images";
import Info from "./Info";

import StyledDetails from "./StyledDetails";

function Details({ product }) {
  const params = useParams();

  const [selectedColorId, setSelectedColorId] = useState(() => {
    return params.colorTypeId || Object.keys(product.images)[0];
  });

  const handleChangeSelectedColorId = useCallback((colorId) => {
    setSelectedColorId(colorId);
  }, []);

  const colors = useMemo(() => {
    const c = {};

    if (product.images) {
      Object.keys(product.images).forEach((i) => {
        if (!c[i]) {
          c[i] = product.images[i][0].url;
        }
      });
    }

    return c;
  }, [product.images]);

  return (
    <StyledDetails imagesNum={product.images.length || 0}>
      <Images
        images={product.images[selectedColorId] || []}
        product_id={product.product_id}
      />
      <Info
        colors={colors}
        handleChangeSelectedColorId={handleChangeSelectedColorId}
        product={product}
      />
      {/* <Description /> */}
      <ProductDetailsFooter currentproductID={product.product_id} />
    </StyledDetails>
  );
}

export default Details;
