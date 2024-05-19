const express = require("express");
const {
  getProductStatusesHandler,
} = require("../request_handlers/product_statuses");

const routes = express.Router();

routes.get("/", getProductStatusesHandler);

module.exports = routes;
