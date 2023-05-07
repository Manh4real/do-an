const db = require("../db");

module.exports = {
  async getProductStatusesHandler(req, res) {
    try {
      const result = await db.query(`
                SELECT * FROM product_statuses
            `);

      res.status(200).json({
        status: "success",
        data: {
          product_statuses: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
