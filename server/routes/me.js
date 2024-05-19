const {
  getCurrentUserHandler,
  updateCurrentUserHandler,
} = require("../request_handlers/users");

const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

routes.get("/", authenticateToken, getCurrentUserHandler);

routes.put("/", authenticateToken, updateCurrentUserHandler);

module.exports = routes;
