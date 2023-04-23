const db = require("../db");

module.exports = {
  async getAllManifacturersHandler(req, res) {
    try {
      const result = await db.query(`SELECT * FROM manufacturers`);

      res.status(200).json({
        status: "success",
        data: {
          manufacturers: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
