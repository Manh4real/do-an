require("dotenv").config();

const _ = require("lodash");
const { getImagesByProductsIDs, getProductsByIDs } = require("../helpers");
const db = require("../db");

module.exports = {
  async getCurrentUserFavoritesHandler(req, res) {
    try {
      const { user_id } = req.user;

      const result = await db.query(
        `SELECT user_id, favorites.product_id, color_id, favorites.size, favorites.size_id, size_type_id
            FROM favorites
            INNER JOIN sizes ON favorites.size_id = sizes.size_id
            WHERE user_id = $1`,
        [user_id]
      );

      const favorites = result.rows;
      let finalFavorites = favorites;

      if (favorites.length > 0) {
        const products_ids = favorites.map((f) => f.product_id);
        const productsQuery = getProductsByIDs(products_ids);
        const productsResult = await db.query(productsQuery, products_ids);

        let products = productsResult.rows;

        // get products' images
        if (products.length > 0) {
          const imageResult = await db.query(
            getImagesByProductsIDs(products_ids),
            products_ids
          );

          const prepared = products_ids.map((_, i) => `$${i + 1}`);

          const stockResult = await db.query(
            `
              SELECT * FROM stock
              INNER JOIN sizes ON stock.size_id = sizes.size_id
              INNER JOIN colors ON colors.color_id = stock.color_id
              INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
              WHERE stock.product_id IN (${prepared.join(",")})
            `,
            products_ids
          );

          products = products.map((p) => {
            const filteredImages = imageResult.rows.filter(
              (i) => i.product_id.trim() === p.product_id.trim()
            );
            const filteredStock = stockResult.rows.filter(
              (s) => s.product_id.trim() === p.product_id.trim()
            );
            const stock = _.groupBy(filteredStock, "color_id");
            const images = _.groupBy(filteredImages, "product_color_id");

            return {
              ...p,
              sizes: p.sizes.split(",").map((s) => s.trim()),
              images: images,
              stock,
            };
          });
        }

        finalFavorites = products.map((p) => {
          const favorite = _.find(
            favorites,
            (f) => f.product_id.trim() === p.product_id.trim()
          );

          return {
            ...p,
            added: {
              colorId: favorite.color_id,
              size: {
                size: favorite.size.trim(),
                size_id: favorite.size_id,
                size_type_id: favorite.size_type_id,
              },
            },
          };
        });
      }

      res.status(200).json({
        status: "success",
        data: {
          favorites: finalFavorites,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateCurrentUserFavoritesHandler(req, res) {
    try {
      const { user_id } = req.user;
      const {
        productId: product_id,
        colorId: color_id,
        size,
        sizeId: size_id,
      } = req.body;

      const response = await db.query(
        "INSERT INTO favorites (user_id, product_id, color_id, size, size_id) VALUES ($1, $2, $3, $4, $5) returning *",
        [user_id, product_id, color_id, size, size_id]
      );
      const addedFavorite = response.rows[0];

      const productResult = await db.query(
        "SELECT * FROM products WHERE products.product_id = $1",
        [addedFavorite.product_id]
      );
      let product = productResult.rows[0];

      const imageResult = await db.query(
        "SELECT * FROM images WHERE images.product_id = $1",
        [product.product_id]
      );

      const images = imageResult.rows;
      const groupedImages = _.groupBy(images, "product_color_id");

      res.status(200).json({
        status: "success",
        data: {
          favorite: {
            ...product,
            images: groupedImages,
            added: {
              colorId: addedFavorite.color_id,
              size: {
                size: addedFavorite.size.trim(),
                size_id: addedFavorite.size_id.trim(),
              },
            },
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteFromCurrentUserFavoritesHandler(req, res) {
    try {
      const { user_id } = req.user;
      const { items } = req.body;

      const products_ids = items.map((i) => +i.product_id);
      // prepared params
      const s = [];
      products_ids.forEach(function (_, i) {
        s.push("$" + (i + 2));
      });
      const prepared = s.join(",");

      await db.query(
        `DELETE FROM favorites WHERE user_id = $1 AND product_id IN (${prepared})`,
        [user_id, ...products_ids]
      );

      res.sendStatus(200);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
