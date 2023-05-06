import React from "react";

import "./RelatedTopicsContainer.css";
import { Link } from "react-router-dom";

function RelatedTopicsContainer() {
  return (
    <div className="related-topics-ctn">
      <div className="title">Related Topics</div>
      <div className="topics">
        <Link to="/">Best Selling Products</Link>
        <Link to="/">Best Shoes</Link>
        <Link to="/">New Basketball Shoes</Link>
        <Link to="/">New Soccer Shoes</Link>
        <Link to="/">New Men's Shoes</Link>
        <Link to="/">New Running Shoes</Link>
        <Link to="/">Best Men's Shoes</Link>
        <Link to="/">New Jordan Shoes</Link>
        <Link to="/">Best Women's Shoes</Link>
        <Link to="/">Best Training & Gym</Link>
      </div>
    </div>
  );
}

export default RelatedTopicsContainer;
