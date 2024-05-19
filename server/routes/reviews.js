const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

const {
  getReviewsByProductIDHandler,
  createReviewHandler,
  getReviewsHandler,
  deleteReviewHandler,
} = require("../request_handlers/reviews");

// get reviews of a product
routes.get("/:productId", getReviewsByProductIDHandler);

routes.get("/", authenticateToken, getReviewsHandler);
routes.post("/", authenticateToken, createReviewHandler);
routes.delete("/", authenticateToken, deleteReviewHandler);

module.exports = routes;
