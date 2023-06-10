require("dotenv").config();

const express = require("express");
const morgan = require("morgan");
const cors = require("cors");

const _ = require("lodash");
// const { saveObjects } = require("./algolia_search");
const { authenticateToken } = require("./middlewares");

const db = require("./db");

const {
  getProductsHandler,
  getProductsByIdsHandler,
  getProductByIdHandler,
  searchProductsHandler,
  getLatestProductsHandler,
  createProductHandler,
  updateProductHandler,
  deleteProductHandler,
  updateProductStatusHandler,
  getActiveProductsHandler,
  searchActiveProductsHandler,
} = require("./request_handlers/products");

const {
  createImageHandler,
  getImagesByProductsIDsHandler,
  getImagesByProductID,
  deleteImageHandler,
  createImagesHandler,
  deleteImagesHandler,
} = require("./request_handlers/images");

const {
  getCurrentUserHandler,
  getUserAvatarHandler,
  getUsersHandler,
  createNewUserHandler,
  updateCurrentUserHandler,
  updateUserHandler,
  deleteUserHandler,
  searchUsersHandler,
  changePasswordHandler,
} = require("./request_handlers/users");

const {
  getCurrentUserFavoritesHandler,
  deleteFromCurrentUserFavoritesHandler,
  updateCurrentUserFavoritesHandler,
} = require("./request_handlers/favorites");

const {
  getReviewsByProductIDHandler,
  createReviewHandler,
  getReviewsHandler,
  deleteReviewHandler,
} = require("./request_handlers/reviews");
const { getColorNameByIDHandler } = require("./request_handlers/colors");
const {
  getAllManifacturersHandler,
  createManufacturerHandler,
  updateManufacturerHandler,
  deleteManufacturerHandler,
} = require("./request_handlers/manifacturers");
const {
  getAllProductTypesHandler,
  deleteProductTypeHandler,
  createProductTypeHandler,
  updateProductTypeHandler,
} = require("./request_handlers/productTypes");
const { getProductStyles } = require("./request_handlers/productStyles");
const {
  createOrderHandler,
  getCurrentUserOrdersHandler,
  getOrdersHandler,
  getOrderByIdHandler,
  updateOrderHandler,
  deleteOrderHandler,
  createOrderReserveStockHandler,
  updateStockAndSaleHandler,
  updateOrderStatusHandler,
} = require("./request_handlers/orders");
const {
  getStockByProductIdHandler,
  getStocksHandler,
  updateStockHandler,
} = require("./request_handlers/stock");
const { getStatisticHandler } = require("./request_handlers/statistic");
const {
  insertProvincesHandler,
  getProvincesHandler,
  getDistrictsHandler,
  getWardsHandler,
} = require("./request_handlers/provinces");
const {
  getProductStatusesHandler,
} = require("./request_handlers/product_statuses");

const app = express();

// use middlewares
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());

// get all products
app.get("/api/v1/products", getActiveProductsHandler);
app.get("/api/v1/a/products", getProductsHandler);

// get products by ids
app.get("/api/v1/products/ids", getProductsByIdsHandler);

// get a product
app.get("/api/v1/products/:id", getProductByIdHandler);

// get products by name (search)
app.get("/api/v1/search", searchActiveProductsHandler);
app.get("/api/v1/a/search", searchProductsHandler);

// get latest products
app.get("/api/v1/latest", getLatestProductsHandler);

// create a product
app.post("/api/v1/products", authenticateToken, createProductHandler);

// update a product
app.put("/api/v1/products/:id", authenticateToken, updateProductHandler);

// update product status
app.put(
  "/api/v1/products/status/:id",
  authenticateToken,
  updateProductStatusHandler
);

// delete a product
app.post(
  "/api/v1/delete/products/:id",
  authenticateToken,
  deleteProductHandler
);

// === IMAGES ===
app.post("/api/v1/images", authenticateToken, createImageHandler);

// create multiple images
app.post("/api/v1/images/multiple", authenticateToken, createImagesHandler);

app.get("/api/v1/images", getImagesByProductsIDsHandler);

app.get("/api/v1/images/product_id/:product_id", getImagesByProductID);

app.delete("/api/v1/images/:id", authenticateToken, deleteImageHandler);
app.delete("/api/v1/images", authenticateToken, deleteImagesHandler);

// ==== USER ===
// get current user
app.get("/api/v1/me", authenticateToken, getCurrentUserHandler);

app.put("/api/v1/me", authenticateToken, updateCurrentUserHandler);

app.get("/api/v1/users/avatar", authenticateToken, getUserAvatarHandler);

app.get("/api/v1/users", authenticateToken, getUsersHandler);
app.get("/api/v1/users/search", authenticateToken, searchUsersHandler);

// create new user
app.post("/api/v1/users", authenticateToken, createNewUserHandler);
// update user
app.put("/api/v1/users/:id", authenticateToken, updateUserHandler);
// delete user
app.post("/api/v1/delete/users/:id", authenticateToken, deleteUserHandler);
// user change password
app.post(
  "/api/v1/users/change_password",
  authenticateToken,
  changePasswordHandler
);

// FAVORITES
app.get("/api/v1/favorites", authenticateToken, getCurrentUserFavoritesHandler);
app.post(
  "/api/v1/favorites",
  authenticateToken,
  updateCurrentUserFavoritesHandler
);
app.delete(
  "/api/v1/favorites",
  authenticateToken,
  deleteFromCurrentUserFavoritesHandler
);

// COLOR
app.get("/api/v1/colors/:id", getColorNameByIDHandler);

// MANUFACTURERS
app.get("/api/v1/manufacturers", getAllManifacturersHandler);
app.post("/api/v1/manufacturers", authenticateToken, createManufacturerHandler);
app.put(
  "/api/v1/manufacturers/:manufacturer_id",
  authenticateToken,
  updateManufacturerHandler
);
app.post(
  "/api/v1/delete/manufacturers/:manufacturer_id",
  authenticateToken,
  deleteManufacturerHandler
);

// TYPE
app.get("/api/v1/types", getAllProductTypesHandler);
app.post("/api/v1/types", authenticateToken, createProductTypeHandler);
app.put("/api/v1/types/:type_id", authenticateToken, updateProductTypeHandler);
app.post(
  "/api/v1/delete/types/:type_id",
  authenticateToken,
  deleteProductTypeHandler
);

// PRODUCT STATUSES
app.get("/api/v1/product-statuses", getProductStatusesHandler);

// STYLES
app.get("/api/v1/styles", getProductStyles);

// REVIEWS
// get reviews of a product
app.get("/api/v1/reviews/:productId", getReviewsByProductIDHandler);

app.get("/api/v1/reviews", authenticateToken, getReviewsHandler);
app.post("/api/v1/reviews", authenticateToken, createReviewHandler);
app.delete("/api/v1/reviews", authenticateToken, deleteReviewHandler);

// ORDERS
app.get("/api/v1/orders", authenticateToken, getCurrentUserOrdersHandler);
// get orders (admin/manager)
app.get("/api/v1/a/orders", authenticateToken, getOrdersHandler);
app.get("/api/v1/orders/:orderId", getOrderByIdHandler);
app.post("/api/v1/orders", authenticateToken, createOrderHandler);
app.post(
  "/api/v1/create-order-reserve-stock",
  authenticateToken,
  createOrderReserveStockHandler
);
app.delete("/api/v1/orders/:orderId", authenticateToken, deleteOrderHandler);
app.post("/api/v1/update-stocks", updateStockAndSaleHandler);

// get order statuses
app.get("/api/v1/order_statuses", async (req, res) => {
  try {
    const response = await db.query(`
      SELECT * FROM order_statuses
      ORDER BY order_status_id ASC
    `);

    res.status(200).json({
      status: "success",
      data: {
        order_statuses: response.rows,
      },
    });
  } catch (err) {}
});
// update payment statuses
app.put("/api/v1/update-payment-status", async (req, res) => {
  try {
    const { payment_status_id, order_id } = req.body;

    const response = await db.query(
      `
        update orders SET payment_status_id = $1
        where orders.order_id = $2
      `,
      [payment_status_id, order_id]
    );

    res.sendStatus(204);
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});
app.get("/api/v1/payment_statuses", async (req, res) => {
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
// update order statuses
app.post("/api/v1/orders/:orderId", authenticateToken, updateOrderHandler);
app.post(
  "/api/v1/orders/status/:orderId",
  authenticateToken,
  updateOrderStatusHandler
);

// STOCK
app.get("/api/v1/stock/:product_id", getStockByProductIdHandler);
app.get("/api/v1/stocks", authenticateToken, getStocksHandler);
app.put("/api/v1/stocks/:stock_id", authenticateToken, updateStockHandler);
// STATISTICS
app.get("/api/v1/statistics", authenticateToken, getStatisticHandler);

// SIZES
app.get("/api/v1/sizes", async (req, res) => {
  try {
    const response = await db.query(`
      SELECT size_id, size_types.size_type_id, size_type_name, size FROM sizes
      INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
    `);

    const sizeGroups = _.groupBy(response.rows, "size_type_id");

    res.status(200).json({
      status: "success",
      data: {
        sizes: sizeGroups,
      },
    });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});
// get sizes by ids
app.get("/api/v1/sizes/multiple", async (req, res) => {
  try {
    const { ids: q } = req.query;

    const ids = q.split(",");

    if (ids.length === 0) {
      res.status(409).json({
        status: "error",
        error: "Size ids are required",
      });
      return;
    }

    const response = await db.query(`
      SELECT size_id, size_types.size_type_id, size_type_name, size FROM sizes
      INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
      WHERE sizes.size_id IN (${ids.join(",")})
    `);

    const sizeGroups = _.groupBy(response.rows, "size_type_id");

    res.status(200).json({
      status: "success",
      data: {
        sizes: sizeGroups,
      },
    });
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});

// ADDRESS
app.post("/api/v1/provinces", insertProvincesHandler);
app.get("/api/v1/provinces", getProvincesHandler);
app.get("/api/v1/districts", getDistrictsHandler);
app.get("/api/v1/wards", getWardsHandler);

const PORT = process.env.PORT || 3005;

app.listen(PORT, () => {
  console.log(`Server is up and listening on port ${PORT}...`);
});
