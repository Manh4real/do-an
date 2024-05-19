const {
  createManufacturerHandler,
  deleteManufacturerHandler,
  getAllManifacturersHandler,
  updateManufacturerHandler,
} = require("../request_handlers/manifacturers");

const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

routes.get("/", getAllManifacturersHandler);
routes.post("/", authenticateToken, createManufacturerHandler);
routes.put("/:manufacturer_id", authenticateToken, updateManufacturerHandler);
routes.post(
  "/delete/:manufacturer_id",
  authenticateToken,
  deleteManufacturerHandler
);

module.exports = routes;
