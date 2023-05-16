require("dotenv").config();

const _ = require("lodash");
const {
  updateProductByID,
  getImagesByProductsIDs,
  getProductsByIDs,
  getCategoriesByProductsIDs,
} = require("../helpers");

const {
  saveObjectsToAlgoliaIndex,
  deleteObjectFromAlgoliaIndex,
  partialUpdateObject,
} = require("../algolia_search");

const db = require("../db");

module.exports = {
  async getActiveProductsHandler(req, res) {
    try {
      let { page = 1 } = req.query;

      page = Number(page);

      if (Number.isNaN(page) || page <= 0) page = 1;

      const products_per_page = 10;
      const from = (page - 1) * products_per_page;
      const to = (page + 1) * products_per_page;

      const getTotalResult = await db.query(
        `SELECT COUNT(1) as total FROM products
         WHERE products.product_status_id = 1
        `
      );
      const total = getTotalResult.rows[0].total || 0;
      const totalPage = Math.ceil(total / products_per_page);

      const result = await db.query(
        `SELECT * FROM products 
            INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
            INNER JOIN styles ON products.style_id = styles.style_id
            INNER JOIN types ON types.type_id = products.type_id
            WHERE products.product_status_id = 1
            ORDER BY products.created_at DESC
            LIMIT $1 OFFSET $2
            `,
        [products_per_page, from]
      );
      // const sizeResult = await db.query(
      //   `
      //     SELECT * FROM product_sizes
      //     INNER JOIN sizes ON product_sizes.size_id = sizes.size_id
      //     INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
      //   `
      // );
      const stockResult = await db.query(
        `
          SELECT * FROM stock
          INNER JOIN sizes ON stock.size_id = sizes.size_id
          INNER JOIN colors ON colors.color_id = stock.color_id
          INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
        `
      );
      let products = result.rows;

      if (products.length > 0) {
        const products_ids = products.map((p) => p.product_id);
        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );
        const categoriesResult = await db.query(
          getCategoriesByProductsIDs(products_ids),
          products_ids
        );

        products = products.map((p) => {
          const filteredImages = imageResult.rows.filter(
            (i) => i.product_id.trim() === p.product_id.trim()
          );
          const filteredCategories = categoriesResult.rows.filter(
            (i) => i.product_id.trim() === p.product_id.trim()
          );
          // const filteredSizes = sizeResult.rows.filter(
          //   (s) => s.product_id.trim() === p.product_id.trim()
          // );
          const filteredStock = stockResult.rows.filter(
            (s) => s.product_id.trim() === p.product_id.trim()
          );
          const images = _.groupBy(filteredImages, "product_color_id");
          // const categoriesResult = _.groupBy(
          //   filteredCategories,
          //   "product_color_id"
          // );
          // const sizes = _.groupBy(filteredSizes, "color_id");
          const stock = _.groupBy(filteredStock, "color_id");

          return {
            ...p,
            sizes: p.sizes.split(",").map((s) => s.trim()),
            // product_sizes: sizes,
            stock,
            images,
            categories: filteredCategories,
          };
        });
      }

      // average rating products
      const avgRatingResult = await db.query(
        `SELECT reviews.product_id, AVG(reviews.rating) as average_rating, COUNT(reviews.rating) as total_reviews FROM products 
        INNER JOIN reviews ON reviews.product_id = products.product_id
        GROUP BY products.product_id, reviews.product_id`
      );
      let avgRatingProducts = avgRatingResult.rows;

      avgRatingProducts = products.map((p) => {
        const r = avgRatingProducts.find(
          (a) => a.product_id.trim() === p.product_id.trim()
        );

        return {
          ...p,
          average_rating: r?.average_rating || 0,
          total_reviews: r?.total_reviews || 0,
        };
      });

      saveObjectsToAlgoliaIndex(avgRatingProducts);
      // end- average rating products

      res.status(200).json({
        status: "success",
        total: total,
        data: {
          products: avgRatingProducts,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: page < totalPage ? page + 1 : totalPage,
            total_page: totalPage,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getProductsHandler(req, res) {
    try {
      let { page = 1 } = req.query;

      page = Number(page);

      if (Number.isNaN(page) || page <= 0) page = 1;

      const products_per_page = 10;
      const from = (page - 1) * products_per_page;
      const to = (page + 1) * products_per_page;

      const getTotalResult = await db.query(
        `SELECT COUNT(1) as total FROM products`
      );
      const total = getTotalResult.rows[0].total || 0;
      const totalPage = Math.ceil(total / products_per_page);

      const result = await db.query(
        `SELECT * FROM products 
            INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
            INNER JOIN styles ON products.style_id = styles.style_id
            INNER JOIN types ON types.type_id = products.type_id
            ORDER BY products.created_at DESC
            LIMIT $1 OFFSET $2
            `,
        [products_per_page, from]
      );
      // const sizeResult = await db.query(
      //   `
      //     SELECT * FROM product_sizes
      //     INNER JOIN sizes ON product_sizes.size_id = sizes.size_id
      //     INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
      //   `
      // );
      const stockResult = await db.query(
        `
          SELECT * FROM stock
          INNER JOIN sizes ON stock.size_id = sizes.size_id
          INNER JOIN colors ON colors.color_id = stock.color_id
          INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
        `
      );
      let products = result.rows;

      if (products.length > 0) {
        const products_ids = products.map((p) => p.product_id);
        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );

        products = products.map((p) => {
          const filteredImages = imageResult.rows.filter(
            (i) => i.product_id.trim() === p.product_id.trim()
          );
          // const filteredSizes = sizeResult.rows.filter(
          //   (s) => s.product_id.trim() === p.product_id.trim()
          // );
          const filteredStock = stockResult.rows.filter(
            (s) => s.product_id.trim() === p.product_id.trim()
          );
          const images = _.groupBy(filteredImages, "product_color_id");
          // const sizes = _.groupBy(filteredSizes, "color_id");
          const stock = _.groupBy(filteredStock, "color_id");

          return {
            ...p,
            sizes: p.sizes.split(",").map((s) => s.trim()),
            // product_sizes: sizes,
            stock,
            images,
          };
        });
      }

      // average rating products
      const avgRatingResult = await db.query(
        `SELECT reviews.product_id, AVG(reviews.rating) as average_rating FROM products 
        INNER JOIN reviews ON reviews.product_id = products.product_id
        GROUP BY products.product_id, reviews.product_id`
      );
      let avgRatingProducts = avgRatingResult.rows;

      avgRatingProducts = products.map((p) => {
        const r = avgRatingProducts.find(
          (a) => a.product_id.trim() === p.product_id.trim()
        );

        return {
          ...p,
          average_rating: r?.average_rating || 0,
        };
      });

      // saveObjectsToAlgoliaIndex(avgRatingProducts);
      // end- average rating products

      res.status(200).json({
        status: "success",
        total: total,
        data: {
          products: avgRatingProducts,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: page < totalPage ? page + 1 : totalPage,
            total_page: totalPage,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getProductsByIdsHandler(req, res) {
    try {
      let { page = 1, q = "" } = req.query;

      if (q === "") {
        res.status(409).json({
          status: "error",
          error: "Products ids are required",
        });
        return;
      }

      page = Number(page);

      if (Number.isNaN(page) || page <= 0) page = 1;

      const products_per_page = 10;
      const from = (page - 1) * products_per_page;
      const to = (page + 1) * products_per_page;

      const products_ids = q.split(",");
      const preparedParam_limit = products_ids.length + 1;
      const preparedParam_offset = products_ids.length + 2;
      const result = await db.query(
        getProductsByIDs(products_ids) +
          ` LIMIT $${preparedParam_limit} OFFSET $${preparedParam_offset}`,
        [...products_ids, products_per_page, from]
      );
      let products = result.rows;

      if (products.length > 0) {
        // $1, $2, ...
        const products_ids = products.map((p) => p.product_id);
        const s = products_ids.map((_, i) => "$" + (i + 1)).join(",");

        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );

        const stockResult = await db.query(
          `
            SELECT * FROM stock
            INNER JOIN sizes ON stock.size_id = sizes.size_id
            INNER JOIN colors ON colors.color_id = stock.color_id
            INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
            WHERE stock.product_id IN (${s})
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

          const images = _.groupBy(filteredImages, "product_color_id");
          const stock = _.groupBy(filteredStock, "color_id");

          return {
            ...p,
            sizes: p.sizes.split(",").map((s) => s.trim()),
            stock,
            images,
          };
        });
      }

      res.status(200).json({
        status: "success",
        results: products.length,
        data: {
          products: products,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: products.length < products_per_page ? page : page + 1,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getProductByIdHandler(req, res) {
    try {
      const { id } = req.params;
      const result = await db.query(
        `SELECT * FROM products 
            INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
            INNER JOIN styles ON products.style_id = styles.style_id
            INNER JOIN types ON types.type_id = products.type_id
            WHERE products.product_id = $1`,
        [id]
      );

      if (result.rows[0]) {
        const imageResult = await db.query(
          "SELECT * FROM images WHERE images.product_id = $1",
          [result.rows[0].product_id]
        );
        const categoriesResult = await db.query(
          `SELECT product_category_id, product_categories.product_id, product_categories.category_id, category_name FROM product_categories 
        INNER JOIN categories ON categories.category_id = product_categories.category_id
        WHERE product_categories.product_id = $1
        `,
          [result.rows[0].product_id]
        );

        // const sizeResult = await db.query(
        //   `
        //     SELECT * FROM product_sizes
        //     INNER JOIN sizes ON product_sizes.size_id = sizes.size_id
        //     INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
        //     WHERE product_sizes.product_id = $1
        //   `,
        //   [id]
        // );
        const stockResult = await db.query(
          `
          SELECT * FROM stock
          INNER JOIN sizes ON stock.size_id = sizes.size_id
          INNER JOIN colors ON colors.color_id = stock.color_id
          INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
          WHERE stock.product_id = $1
        `,
          [id]
        );

        const filteredImages = imageResult.rows.filter(
          (i) => i.product_id.trim() === id.trim()
        );
        // const filteredSizes = sizeResult.rows.filter(
        //   (s) => s.product_id.trim() === id.trim()
        // );
        const filteredStock = stockResult.rows.filter(
          (s) => s.product_id.trim() === id.trim()
        );

        const images = _.groupBy(filteredImages, "product_color_id");
        const stock = _.groupBy(filteredStock, "color_id");
        // const sizes = _.groupBy(filteredSizes, "color_id");

        // console.log(images);

        res.status(200).json({
          status: "success",
          data: {
            product: {
              ...result.rows[0],
              sizes: result.rows[0].sizes.split(",").map((size) => size.trim()),
              // product_sizes: sizes,
              stock,
              images: images,
              categories: categoriesResult.rows,
            },
          },
        });
      } else {
        res.status(404).json({
          status: "error",
          message: "Product not found",
        });
      }
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async searchActiveProductsHandler(req, res) {
    try {
      let { page = 1, q = "" } = req.query;

      page = Number(page);
      q = q.toString().trim().toLowerCase();

      if (Number.isNaN(page) || page <= 0) page = 1;

      const products_per_page = 10;
      const from = (page - 1) * products_per_page;
      const to = (page + 1) * products_per_page;

      const getTotalResult = await db.query(
        `SELECT COUNT(1) as total FROM products
          WHERE LOWER(products.product_name) LIKE '%' || $1 || '%'
            AND products.product_status_id = 1
        `,
        [q]
      );
      const total = getTotalResult.rows[0].total || 0;
      const totalPage = Math.ceil(total / products_per_page);

      const result = await db.query(
        `SELECT * FROM products 
            INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
            INNER JOIN styles ON products.style_id = styles.style_id
            INNER JOIN types ON types.type_id = products.type_id
            WHERE LOWER(products.product_name) LIKE '%' || $1 || '%'
             AND products.product_status_id = 1
            ORDER BY products.created_at DESC
            LIMIT $2 OFFSET $3
            `,
        [q, products_per_page, from]
      );

      const stockResult = await db.query(
        `
          SELECT stock_id, stock.product_id, stock.color_id, stock.size_id, stock.quantity, size, sizes.size_type_id, color_name, color_code, size_type_name FROM stock
          INNER JOIN sizes ON stock.size_id = sizes.size_id
          INNER JOIN colors ON colors.color_id = stock.color_id
          INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
          INNER JOIN products ON products.product_id = stock.product_id
          WHERE products.product_status_id = 1
        `
      );
      let products = result.rows;

      if (products.length > 0) {
        const products_ids = products.map((p) => p.product_id);
        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );
        const categoriesResult = await db.query(
          getCategoriesByProductsIDs(products_ids),
          products_ids
        );

        products = products.map((p) => {
          const filteredImages = imageResult.rows.filter(
            (i) => i.product_id.trim() === p.product_id.trim()
          );
          const filteredStock = stockResult.rows.filter(
            (s) => s.product_id.trim() === p.product_id.trim()
          );
          const filteredCategories = categoriesResult.rows.filter(
            (s) => s.product_id.trim() === p.product_id.trim()
          );
          const images = _.groupBy(filteredImages, "product_color_id");
          // const sizes = _.groupBy(filteredSizes, "color_id");
          const stock = _.groupBy(filteredStock, "color_id");

          return {
            ...p,
            sizes: p.sizes.split(",").map((s) => s.trim()),
            stock,
            images,
            categories: filteredCategories,
          };
        });
      }

      // average rating products
      const avgRatingResult = await db.query(
        `SELECT reviews.product_id, AVG(reviews.rating) as average_rating FROM products 
        INNER JOIN reviews ON reviews.product_id = products.product_id
          AND products.product_status_id = 1
        GROUP BY products.product_id, reviews.product_id`
      );
      let avgRatingProducts = avgRatingResult.rows;

      avgRatingProducts = products.map((p) => {
        const r = avgRatingProducts.find(
          (a) => a.product_id.trim() === p.product_id.trim()
        );

        return {
          ...p,
          average_rating: r?.average_rating || 0,
        };
      });

      // end- average rating products

      res.status(200).json({
        status: "success",
        total: total,
        data: {
          products: avgRatingProducts,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: page < totalPage ? page + 1 : totalPage,
            total_page: totalPage,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async searchProductsHandler(req, res) {
    try {
      let { page = 1, q = "" } = req.query;

      page = Number(page);
      q = q.toString().trim().toLowerCase();

      if (Number.isNaN(page) || page <= 0) page = 1;

      const products_per_page = 10;
      const from = (page - 1) * products_per_page;
      const to = (page + 1) * products_per_page;

      const getTotalResult = await db.query(
        `SELECT COUNT(1) as total FROM products
          WHERE LOWER(products.product_name) LIKE '%' || $1 || '%' 
        `,
        [q]
      );
      const total = getTotalResult.rows[0].total || 0;
      const totalPage = Math.ceil(total / products_per_page);

      const result = await db.query(
        `SELECT * FROM products 
            INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
            INNER JOIN styles ON products.style_id = styles.style_id
            INNER JOIN types ON types.type_id = products.type_id
            WHERE LOWER(products.product_name) LIKE '%' || $1 || '%'
            ORDER BY products.created_at DESC
            LIMIT $2 OFFSET $3
            `,
        [q, products_per_page, from]
      );

      const stockResult = await db.query(
        `
          SELECT * FROM stock
          INNER JOIN sizes ON stock.size_id = sizes.size_id
          INNER JOIN colors ON colors.color_id = stock.color_id
          INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
        `
      );
      let products = result.rows;

      if (products.length > 0) {
        const products_ids = products.map((p) => p.product_id);
        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );

        products = products.map((p) => {
          const filteredImages = imageResult.rows.filter(
            (i) => i.product_id.trim() === p.product_id.trim()
          );
          const filteredStock = stockResult.rows.filter(
            (s) => s.product_id.trim() === p.product_id.trim()
          );
          const images = _.groupBy(filteredImages, "product_color_id");
          // const sizes = _.groupBy(filteredSizes, "color_id");
          const stock = _.groupBy(filteredStock, "color_id");

          return {
            ...p,
            sizes: p.sizes.split(",").map((s) => s.trim()),
            stock,
            images,
          };
        });
      }

      // average rating products
      const avgRatingResult = await db.query(
        `SELECT reviews.product_id, AVG(reviews.rating) as average_rating FROM products 
        INNER JOIN reviews ON reviews.product_id = products.product_id
          AND products.product_status_id = 1
        GROUP BY products.product_id, reviews.product_id`
      );
      let avgRatingProducts = avgRatingResult.rows;

      avgRatingProducts = products.map((p) => {
        const r = avgRatingProducts.find(
          (a) => a.product_id.trim() === p.product_id.trim()
        );

        return {
          ...p,
          average_rating: r?.average_rating || 0,
        };
      });

      // end- average rating products

      res.status(200).json({
        status: "success",
        total: total,
        data: {
          products: avgRatingProducts,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: page < totalPage ? page + 1 : totalPage,
            total_page: totalPage,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getLatestProductsHandler(req, res) {
    try {
      const result = await db.query(
        `SELECT * FROM products 
        INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
        INNER JOIN styles ON products.style_id = styles.style_id
        INNER JOIN types ON types.type_id = products.type_id
          AND products.product_status_id = 1
        ORDER BY created_at desc limit 10`
      );

      let products = result.rows;
      const products_ids = products.map((p) => p.product_id);

      if (products.length > 0) {
        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );

        products = products.map((p) => {
          const filteredImages = imageResult.rows.filter(
            (i) => i.product_id.trim() === p.product_id.trim()
          );
          const images = _.groupBy(filteredImages, "product_color_id");
          return {
            ...p,
            sizes: p.sizes.split(",").map((s) => s.trim()),
            images: images,
          };
        });

        // average rating products
        const avgRatingResult = await db.query(
          `SELECT reviews.product_id, AVG(reviews.rating) as average_rating FROM products 
        INNER JOIN reviews ON reviews.product_id = products.product_id
          AND products.product_status_id = 1
        GROUP BY products.product_id, reviews.product_id`
        );
        let avgRatingProducts = avgRatingResult.rows;

        avgRatingProducts = products.map((p) => {
          const r = avgRatingProducts.find(
            (a) => a.product_id.trim() === p.product_id.trim()
          );

          return {
            ...p,
            average_rating: r?.average_rating || 0,
          };
        });

        products = avgRatingProducts;
        // end - average rating products
      }

      res.status(200).json({
        status: "success",
        data: {
          products: products,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createProductHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const {
        category,
        product_name,
        type,
        gender,
        target,
        color_num,
        price,
        on_sale,
        old_price,
        sizes,
        quantity = 1,
        description,
        manufacturer_id,
        style_id,
        type_id,
        stock,
        size_type_id,
      } = req.body;

      const result = await db.query(
        `INSERT INTO products (
          category, 
          product_name, 
          type, 
          gender, 
          target, 
          color_num, 
          price, 
          on_sale, 
          old_price, 
          sizes, 
          quantity,
          description,
          manufacturer_id,
          style_id,
          type_id,
          size_type_id)
        VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16) returning *`,
        [
          category,
          product_name,
          type,
          gender,
          target,
          color_num,
          price,
          on_sale,
          old_price,
          sizes,
          quantity,
          description,
          manufacturer_id,
          style_id,
          type_id,
          size_type_id,
        ]
      );

      // create product stock
      if (Object.keys(stock).length > 0) {
        const promises = [];

        Object.entries(stock).forEach(([color_id, stock]) => {
          for (let i = 0; i < stock.length; i++) {
            console.log("inserting product stock...");

            const createProductStockQuery = db.query(
              "INSERT INTO stock (product_id, color_id, size_id, quantity) VALUES ($1, $2, $3, $4)",
              [
                result.rows[0].product_id,
                color_id,
                stock[i].size_id,
                stock[i].quantity,
              ]
            );

            promises.push(createProductStockQuery);
          }
        });

        await Promise.all(promises)
          .then(() => {
            console.log("Created product stock");
          })
          .catch(() => {
            console.log("Error: Can't create product stock");
          });
      }
      // end - create product stock

      res.status(201).json({
        status: "success",
        data: {
          product: result.rows[0],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateProductHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { id } = req.params;
      const { removedColors, changedStock, ...body } = req.body;
      const colValues = Object.keys(body).map(function (key) {
        return body[key];
      });

      const result = await db.query(updateProductByID(id, body), colValues);

      // update stock
      if (Object.keys(changedStock).length > 0) {
        const promises = [];

        // remove all stocks of the product
        const deleteStockQuery = await db.query(
          `
            DELETE FROM stock WHERE stock.product_id = $1
          `,
          [id]
        );

        // promises.push(deleteStockQuery);
        // end - remove all stocks of the product

        // insert new stocks
        Object.entries(changedStock).forEach(([color_id, stock]) => {
          stock.forEach((s) => {
            const { color_id, quantity, size_id } = s;

            const insertStockQuery = db.query(
              `
                INSERT INTO stock (product_id, color_id, size_id, quantity) VALUES($1, $2, $3, $4)
              `,
              [id, color_id, size_id, quantity]
            );

            promises.push(insertStockQuery);
          });
        });

        await Promise.all(promises)
          .then(() => {
            console.log("Updated stock of product " + id);
          })
          .catch((err) => {
            console.log("Error: Can't updated stock of product " + id);
            console.log(err);
          });
      }
      // end - update stock

      // get stock
      const selectStockQuery = await db.query(
        `
        SELECT * FROM stock
        INNER JOIN sizes ON stock.size_id = sizes.size_id
        INNER JOIN colors ON colors.color_id = stock.color_id
        INNER JOIN size_types ON size_types.size_type_id = sizes.size_type_id
        WHERE stock.product_id = $1
      `,
        [id]
      );

      const filteredStock = selectStockQuery.rows.filter(
        (s) => s.product_id.trim() === id.trim()
      );
      const stock = _.groupBy(filteredStock, "color_id");
      // end - get stock

      // update in Algolia Index
      partialUpdateObject({
        ...body,
        product_id: id,
      });

      res.status(200).json({
        status: "success",
        data: {
          product: { ...result.rows[0], stock },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteProductHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { id } = req.params;

      const images = await db.query(
        `SELECT images.url FROM images WHERE images.product_id = $1`,
        [id]
      );

      const deleteFromImagesResult = await db.query(
        "DELETE FROM images WHERE images.product_id = $1",
        [id]
      );

      const deleteFromStockResult = await db.query(
        "DELETE FROM stock WHERE stock.product_id = $1",
        [id]
      );

      const deleteFromFavoritesResult = await db.query(
        "DELETE FROM favorites WHERE favorites.product_id = $1",
        [id]
      );

      const deleteFromOrdersResult = await db.query(
        "DELETE FROM order_items WHERE order_items.product_id = $1",
        [id]
      );

      const deleteFromReviewsResult = await db.query(
        "DELETE FROM reviews WHERE reviews.product_id = $1",
        [id]
      );

      const result = await db.query(
        "DELETE FROM products WHERE products.product_id = $1",
        [id]
      );

      // delete from Algolia Index
      deleteObjectFromAlgoliaIndex(id);

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
  async updateProductStatusHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { product_status_id } = req.body;
      const { id } = req.params;

      const result = await db.query(
        `
          UPDATE products SET product_status_id = $1
          WHERE products.product_id = $2
        `,
        [product_status_id, id]
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
