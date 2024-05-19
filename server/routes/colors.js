const express = require("express");
const { authenticateToken } = require("../middlewares");
const { getColorNameByIDHandler } = require("../request_handlers/colors");

const routes = express.Router();

routes.get("/:id", getColorNameByIDHandler);

module.exports = routes;
