const db = require("../db");

module.exports = {
  async getAllProductTypesHandler(req, res) {
    try {
      const result = await db.query(`SELECT * FROM types`);

      res.status(200).json({
        status: "success",
        data: {
          types: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
