const express = require("express");

const routes = express.Router();

routes.get("/", async (req, res) => {
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
routes.get("/multiple", async (req, res) => {
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

module.exports = routes;
