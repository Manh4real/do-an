const {
  getStockByProductIdHandler,
  getStocksHandler,
  updateStockHandler,
} = require("../request_handlers/stock");

const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

routes.get("/:product_id", getStockByProductIdHandler);
routes.get("/", authenticateToken, getStocksHandler);
routes.put("/:stock_id", authenticateToken, updateStockHandler);

module.exports = routes;
