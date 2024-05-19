const express = require("express");
const { authenticateToken } = require("../middlewares");
const { getStatisticHandler } = require("../request_handlers/statistic");

const routes = express.Router();

routes.get("/", authenticateToken, getStatisticHandler);

module.exports = routes;
