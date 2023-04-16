import React from "react";
import { useParams } from "react-router-dom";

import StyledProductDetails from "./StyledProductDetails";

import Spinner from "components/Spinner";
import Details from "./Details";

import { useGetProductById } from "services/products";

function ProductDetails() {
  const { productId } = useParams();
  // const { data, isLoading } = useGetProductQuery(productId);
  const { product, isLoading } = useGetProductById(productId);

  let content;
  if (isLoading) {
    content = <Spinner />;
  } else {
    content = product ? <Details product={product} /> : <NotFoundProduct />;
  }

  return <StyledProductDetails>{content}</StyledProductDetails>;
}

const NotFoundProduct = () => {
  return <h1>Not found product.</h1>;
};

export default ProductDetails;
