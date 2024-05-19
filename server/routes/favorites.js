const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

const {
  getCurrentUserFavoritesHandler,
  deleteFromCurrentUserFavoritesHandler,
  updateCurrentUserFavoritesHandler,
} = require("../request_handlers/favorites");

routes.get("/", authenticateToken, getCurrentUserFavoritesHandler);
routes.post("/", authenticateToken, updateCurrentUserFavoritesHandler);
routes.delete("/", authenticateToken, deleteFromCurrentUserFavoritesHandler);

module.exports = routes;
