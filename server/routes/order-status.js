const express = require("express");
const { authenticateToken } = require("../middlewares");
const db = require("../db");

const routes = express.Router();

routes.get("/order-statuses", async (req, res) => {
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

module.exports = routes;
