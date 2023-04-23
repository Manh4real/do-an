const db = require("../db");
const _ = require("lodash");

module.exports = {
  async createProductStockHandler(req, res) {
    try {
      const { product_id, color_id, size_id, quantity } = req.body;

      const result = await db.query(
        "INSERT INTO stock (product_id, color_id, size_id, quantity) VALUES ($1, $2, $3, $4)",
        [product_id, color_id, size_id, quantity]
      );

      res.status(200).json({
        status: "success",
        data: {
          stock: result.rows[0],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getStockByProductIdHandler(req, res) {
    try {
      const { product_id } = req.params;

      const result = await db.query(
        `
        SELECT * FROM stock
        WHERE stock.product_id = $1
      `,
        [product_id]
      );

      const stockGroup = _.groupBy(result.rows, "color_id");

      res.status(200).json({
        status: "success",
        data: {
          stock: stockGroup,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
