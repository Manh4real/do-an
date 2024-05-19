const db = require("../db");

const { updateStockAndSaleHandler } = require("../request_handlers/orders");
const {
  insertProvincesHandler,
  getProvincesHandler,
  getDistrictsHandler,
  getWardsHandler,
} = require("../request_handlers/provinces");
const {} = require("../request_handlers/product_statuses");

const express = require("express");

const productRoutes = require("./products");
const searchRoutes = require("./search");
const imageRoutes = require("./images");
const favoritesRoutes = require("./favorites");
const reviewRoutes = require("./reviews");
const userRoutes = require("./users");
const currentUserRoutes = require("./me");
const manufacturerRoutes = require("./manufacturers");
const typesRoutes = require("./types");
const ordersRoutes = require("./orders");
const stockRoutes = require("./stock");
const sizesRoutes = require("./sizes");
const colorRoutes = require("./colors");
const styleRoutes = require("./styles");
const orderStatusRoutes = require("./order-status");
const productStatusRoutes = require("./product-status");
const statisticsRoutes = require("./statistics");

const routes = express.Router();

routes.use("/products", productRoutes);
routes.use("/search", searchRoutes);
routes.use("/images", imageRoutes);
routes.use("/users", userRoutes);
routes.use("/me", currentUserRoutes);
routes.use("/favorites", favoritesRoutes);
routes.use("/manufacturers", manufacturerRoutes);
routes.use("/types", typesRoutes);
routes.use("/reviews", reviewRoutes);
routes.use("/orders", ordersRoutes);
routes.use("/stock", stockRoutes);
routes.use("/sizes", sizesRoutes);
routes.use("/colors", colorRoutes);
routes.use("/styles", styleRoutes);
routes.use("/order-statuses", orderStatusRoutes);
routes.use("/product-statuses", productStatusRoutes);
routes.use("/statistics", statisticsRoutes);

// ORDERS
routes.post("/update-stocks", updateStockAndSaleHandler);

routes.get("/payment_statuses", async (req, res) => {
  try {
    const response = await db.query(`
      SELECT * FROM payment_statuses
      ORDER BY payment_status_id ASC
    `);

    res.status(200).json({
      status: "success",
      data: {
        payment_statuses: response.rows,
      },
    });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});

// ADDRESS
routes.post("/provinces", insertProvincesHandler);
routes.get("/provinces", getProvincesHandler);
routes.get("/districts", getDistrictsHandler);
routes.get("/wards", getWardsHandler);

module.exports = routes;
