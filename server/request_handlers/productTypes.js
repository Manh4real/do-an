const { deleteObjectsFromAlgoliaIndex } = require("../algolia_search");
const db = require("../db");
// const { deleteProductHandler } = require("./products");

module.exports = {
  async getAllProductTypesHandler(req, res) {
    try {
      const result = await db.query(`SELECT * FROM types`);

      res.status(200).json({
        status: "success",
        total: result.rows.length,
        data: {
          types: result.rows,
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
  async deleteProductTypeHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { type_id } = req.params;

      // delete product related
      const images = await db.query(
        `SELECT images.url FROM images
         INNER JOIN products ON images.product_id = products.product_id
         WHERE products.type_id = $1
        `,
        [type_id]
      );

      const deleteFromImagesResult = await db.query(
        `
          DELETE FROM images
          USING products
          WHERE products.product_id = images.product_id 
            AND products.type_id = $1
        `,
        [type_id]
      );

      const deleteFromStockResult = await db.query(
        `
          DELETE FROM stock
          USING products
          WHERE products.product_id = stock.product_id 
            AND products.type_id = $1
        `,
        [type_id]
      );

      const deleteFromFavoritesResult = await db.query(
        `
          DELETE FROM favorites
          USING products
          WHERE products.product_id = favorites.product_id 
            AND products.type_id = $1
        `,
        [type_id]
      );

      const deleteFromOrdersResult = await db.query(
        `
          DELETE FROM order_items
          USING products
          WHERE products.product_id = order_items.product_id 
            AND products.type_id = $1
        `,
        [type_id]
      );

      const deleteFromReviewsResult = await db.query(
        `
          DELETE FROM reviews
          USING products
          WHERE products.product_id = reviews.product_id 
            AND products.type_id = $1
        `,
        [type_id]
      );

      const productsResult = await db.query(
        `
        SELECT product_id FROM products
        WHERE products.type_id = $1
      `,
        [type_id]
      );

      const deleteProductsResult = await db.query(
        `DELETE FROM products WHERE products.type_id = $1`,
        [type_id]
      );

      // productsResult.rows.forEach(({ product_id }) => {
      // delete from Algolia Index
      deleteObjectsFromAlgoliaIndex(
        productsResult.rows.map((p) => p.product_id)
      );
      // });

      // end - delete product related

      // delete product type
      await db.query(`DELETE FROM types WHERE types.type_id = $1`, [type_id]);

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
  async createProductTypeHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { type_name } = req.body;

      if (!type_name) {
        res.status(409).json({
          status: "error",
          error: "Product type name is required",
        });
        return;
      }

      const result = await db.query(
        `INSERT INTO types (type_name) VALUES ($1)`,
        [type_name]
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateProductTypeHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { type_name } = req.body;
      const { type_id } = req.params;

      if (!type_name) {
        res.status(409).json({
          status: "error",
          error: "Product type name is required",
        });
        return;
      }

      const result = await db.query(
        `
          UPDATE types SET type_name = ($1)
          WHERE types.type_id = $2
        `,
        [type_name, type_id]
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatu(500);
    }
  },
};
