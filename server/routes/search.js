const {
  searchActiveProductsHandler,
  searchProductsHandler,
} = require("../request_handlers/products");

const express = require("express");

const routes = express.Router();

routes.get("/", searchActiveProductsHandler);
routes.get("/all", searchProductsHandler);

module.exports = routes;
