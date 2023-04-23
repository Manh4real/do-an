const db = require("../db");

module.exports = {
  async getColorNameByIDHandler(req, res) {
    try {
      const { id: colorId } = req.params;

      const result = await db.query(
        "SELECT colors.color_name FROM colors WHERE colors.color_id = $1",
        [colorId]
      );

      res.status(200).json({
        status: "success",
        data: {
          color: result.rows[0],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
