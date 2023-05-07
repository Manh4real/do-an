const { deleteObjectFromAlgoliaIndex } = require("../algolia_search");
const db = require("../db");
const { updateManufacturerByID } = require("../helpers");

module.exports = {
  async getAllManifacturersHandler(req, res) {
    try {
      const result = await db.query(`SELECT * FROM manufacturers`);

      res.status(200).json({
        status: "success",
        total: result.rows.length,
        data: {
          manufacturers: result.rows,
        },
        meta: {
          pagination: {
            total_page: 1,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createManufacturerHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { manufacturer_name, brand_name } = req.body;

      if (!manufacturer_name) {
        res.status(409).json({
          status: "error",
          error: "Manufacturer name is required",
        });
        return;
      }
      if (!brand_name) {
        res.status(409).json({
          status: "error",
          error: "Brand name is required",
        });
        return;
      }

      const result = await db.query(
        `
        INSERT INTO manufacturers (manufacturer_name, brand_name)
        VALUES ($1, $2)
      `,
        [manufacturer_name, brand_name]
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateManufacturerHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { manufacturer_id } = req.params;

      const body = req.body;
      const colValues = Object.keys(req.body).map(function (key) {
        return req.body[key];
      });

      const result = await db.query(
        updateManufacturerByID(manufacturer_id, body),
        colValues
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteManufacturerHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { manufacturer_id } = req.params;

      // delete product related
      const images = await db.query(
        `SELECT images.url FROM images
         INNER JOIN products ON images.product_id = products.product_id
         WHERE products.manufacturer_id = $1
        `,
        [manufacturer_id]
      );

      const deleteFromImagesResult = await db.query(
        `
          DELETE FROM images
          USING products
          WHERE products.product_id = images.product_id AND products.manufacturer_id = $1
        `,
        [manufacturer_id]
      );

      const deleteFromStockResult = await db.query(
        `
          DELETE FROM stock
          USING products
          WHERE products.product_id = stock.product_id AND products.manufacturer_id = $1
        `,
        [manufacturer_id]
      );

      const deleteFromFavoritesResult = await db.query(
        `
          DELETE FROM favorites
          USING products
          WHERE products.product_id = favorites.product_id AND products.manufacturer_id = $1
        `,
        [manufacturer_id]
      );

      const deleteFromOrdersResult = await db.query(
        `
          DELETE FROM order_items
          USING products
          WHERE products.product_id = order_items.product_id AND products.manufacturer_id = $1
        `,
        [manufacturer_id]
      );

      const deleteFromReviewsResult = await db.query(
        `
          DELETE FROM reviews
          USING products
          WHERE products.product_id = reviews.product_id AND products.manufacturer_id = $1
        `,
        [manufacturer_id]
      );

      const productsResult = await db.query(
        `
        SELECT product_id FROM products
        WHERE products.manufacturer_id = $1
      `,
        [manufacturer_id]
      );

      const deleteProductsResult = await db.query(
        "DELETE FROM products WHERE products.manufacturer_id = $1",
        [manufacturer_id]
      );

      productsResult.rows.forEach(({ product_id }) => {
        // delete from Algolia Index
        deleteObjectFromAlgoliaIndex(product_id);
      });

      // end - delete product related

      // delete manufacturer
      await db.query(
        `DELETE FROM manufacturers WHERE manufacturers.manufacturer_id = $1`,
        [manufacturer_id]
      );

      res.status(200).json({
        status: "success",
        data: {
          images: images.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
