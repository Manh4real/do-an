const express = require("express");
const { getProductStyles } = require("../request_handlers/productStyles");

const routes = express.Router();

routes.get("/", getProductStyles);

module.exports = routes;
