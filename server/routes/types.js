const {
  createProductTypeHandler,
  deleteProductTypeHandler,
  getAllProductTypesHandler,
  updateProductTypeHandler,
} = require("../request_handlers/productTypes");

const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

routes.get("/", getAllProductTypesHandler);
routes.post("/", authenticateToken, createProductTypeHandler);
routes.put("/:type_id", authenticateToken, updateProductTypeHandler);
routes.post("/delete/:type_id", authenticateToken, deleteProductTypeHandler);

module.exports = routes;
