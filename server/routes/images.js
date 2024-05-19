const express = require("express");
const { authenticateToken } = require("../middlewares");

const {
  createImageHandler,
  getImagesByProductsIDsHandler,
  getImagesByProductID,
  deleteImageHandler,
  createImagesHandler,
  deleteImagesHandler,
} = require("../request_handlers/images");

const routes = express.Router();

routes.post("/", authenticateToken, createImageHandler);

// create multiple images
routes.post("/multiple", authenticateToken, createImagesHandler);

routes.get("/", getImagesByProductsIDsHandler);

routes.get("/product_id/:product_id", getImagesByProductID);

routes.delete("/:id", authenticateToken, deleteImageHandler);
routes.delete("/", authenticateToken, deleteImagesHandler);

module.exports = routes;
