const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

const {
  getProductsHandler,
  getProductsByIdsHandler,
  getProductByIdHandler,
  getActiveProductsHandler,
  createProductHandler,
  updateProductHandler,
  updateProductStatusHandler,
  deleteProductHandler,
  getLatestProductsHandler,
} = require("../request_handlers/products");

// get all products
routes.get("/", getActiveProductsHandler);
routes.get("/all", getProductsHandler);
// create a product
routes.post("/", authenticateToken, createProductHandler);

// get products by ids
routes.get("/ids", getProductsByIdsHandler);

// get a product
routes.get("/:id", getProductByIdHandler);

// update a product
routes.put("/:id", authenticateToken, updateProductHandler);

// update product status
routes.put("/status/:id", authenticateToken, updateProductStatusHandler);

// delete a product
routes.post("/delete/:id", authenticateToken, deleteProductHandler);

// get latest products
routes.get("/latest", getLatestProductsHandler);

module.exports = routes;
