require("dotenv").config();

const { getImagesByProductsIDs } = require("../helpers");

const db = require("../db");

module.exports = {
  async createImageHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { url, product_id, product_color_id } = req.body;
      const result = await db.query(
        "INSERT INTO images (url, product_id, product_color_id) VALUES ($1, $2, $3) returning *",
        [url, product_id, product_color_id]
      );

      res.status(200).json({
        status: "success",
        data: {
          image: result.rows[0],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createImagesHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      if (!Array.isArray(req.body) || req.body.length === 0) {
        res.status(409).json({
          status: "error",
          error: "Images info is required",
        });

        return;
      }

      // const { url, product_id, product_color_id } = req.body;

      let query =
        "INSERT INTO images (url, product_id, product_color_id) VALUES ";
      const values = [];

      let j = 0;
      let str = req.body.map(({ url, product_id, product_color_id }, i) => {
        let s =
          "($" + (i + j + 1) + ",$" + (i + j + 2) + ",$" + (i + j + 3) + ")";
        values.push(url, product_id, product_color_id);
        j += 2;

        return s;
      });
      str = str.join(", ");

      query += str + " returning *";

      // console.log(query);

      const result = await db.query(query, values);

      res.status(200).json({
        status: "success",
        data: {
          images: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getImagesByProductsIDsHandler(req, res) {
    // console.log("getting images...");

    try {
      let { products_ids } = req.query;

      if (!products_ids) return;

      products_ids = products_ids.split(",").map((id) => id.trim());
      // console.log(getImagesByProductsIDs(products_ids));
      const result = await db.query(
        getImagesByProductsIDs(products_ids),
        products_ids
      );

      // const result = await db.query("SELECT * FROM images WHERE images.product_id = $1", [product_id])

      res.status(200).json({
        status: "success",
        data: {
          images: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getImagesByProductID(req, res) {
    // console.log("getting images...");

    try {
      let { product_id } = req.params;

      if (!product_id) return;

      const result = await db.query(
        "SELECT * FROM images WHERE images.product_id = $1",
        [product_id]
      );

      res.status(200).json({
        status: "success",
        data: {
          images: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteImageHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { id } = req.params;
      const result = await db.query(
        "DELETE FROM images WHERE images.image_id = $1",
        [id]
      );

      res.status(204).json({
        status: "success",
        data: {
          images: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteImagesHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { ids: idsString } = req.query;
      const ids = idsString.split(",").map((id) => id.trim());

      if (ids.length === 0) {
        res.status(409).json({
          status: "error",
          error: "Ids need to be provided",
        });
        return;
      }

      let s = ids.map((_, i) => {
        return "$" + (i + 1);
      });
      s = "(" + s.join(",") + ")";

      const result = await db.query(
        "DELETE FROM images WHERE images.image_id IN " + s,
        ids
      );

      res.status(204).json({
        status: "success",
        data: {
          images: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
