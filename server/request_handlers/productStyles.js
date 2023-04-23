const db = require("../db");

module.exports = {
  async getProductStyles(req, res) {
    try {
      const result = await db.query(`SELECT * FROM styles`);

      res.status(200).json({
        status: "success",
        data: {
          styles: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
