const {
  createOrderHandler,
  createOrderReserveStockHandler,
  deleteOrderHandler,
  getCurrentUserOrdersHandler,
  getOrderByIdHandler,
  getOrdersHandler,
  updateOrderHandler,
  updateOrderStatusHandler,
} = require("../request_handlers/orders");
const db = require("../db");

const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

routes.get("/", authenticateToken, getCurrentUserOrdersHandler);
// get orders (admin/manager)
routes.get("/all", authenticateToken, getOrdersHandler);
routes.get("/:orderId", getOrderByIdHandler);
routes.post("/", authenticateToken, createOrderHandler);
routes.post(
  "/create-and-reserve-stock",
  authenticateToken,
  createOrderReserveStockHandler
);
routes.delete("/:orderId", authenticateToken, deleteOrderHandler);
routes.post("/:orderId", authenticateToken, updateOrderHandler);
routes.post("/status/:orderId", authenticateToken, updateOrderStatusHandler);

// update order payment statuses
routes.put("/update-payment-status", async (req, res) => {
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

module.exports = routes;
