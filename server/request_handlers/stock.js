const db = require("../db");
const _ = require("lodash");
const { getImagesByProductsIDs } = require("../helpers");

module.exports = {
  async getStocksHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      // pagination
      let { page = 1 } = req.query;

      page = Number(page);

      if (Number.isNaN(page) || page <= 0) page = 1;

      const stocks_per_page = 10;
      const from = (page - 1) * stocks_per_page;
      const to = (page + 1) * stocks_per_page;

      const getTotalResult = await db.query(
        `SELECT COUNT(1) as total FROM stock
        GROUP BY product_id`
      );
      const getProductsIdsResult = await db.query(
        `SELECT stock.product_id FROM stock GROUP BY product_id 
          LIMIT $1 OFFSET $2`, [stocks_per_page, from]
      );
      const total = getTotalResult.rows.length;
      const pIds = getProductsIdsResult.rows.length;
      const totalPage = Math.ceil(total / stocks_per_page);
      // end-pagination

      const result = await db.query(
        `
        SELECT 
          stock_id, stock.product_id, stock.color_id, stock.size_id, stock.quantity, 
          product_name, type, gender, price, created_at,
          products.manufacturer_id, manufacturer_name, 
          style_id, products.type_id, type_name, sizes.size_type_id, color_name, size 
        FROM stock
        INNER JOIN products ON products.product_id = stock.product_id
        INNER JOIN colors ON colors.color_id = stock.color_id
        INNER JOIN sizes ON sizes.size_id = stock.size_id
        INNER JOIN types ON types.type_id = products.type_id
        INNER JOIN manufacturers ON manufacturers.manufacturer_id = products.manufacturer_id

        WHERE stock.product_id IN (SELECT stock.product_id FROM stock GROUP BY product_id LIMIT $1 OFFSET $2)
    
        ORDER BY products.product_id DESC, sizes.size_id ASC
      `, [stocks_per_page, from]
      );

      /*
        stock: {
          [product_id]: {
            ...product
            colors: {
              [color_id]: {
                ...color,
                sizes: [
                  {stock_id, color_id, size_id, size, quantity, ...},
                  {stock_id, color_id, size_id, size, quantity, ...}
                  ...
                ]
              }
            }
          }
        }
       */
      const stock = _.groupBy(result.rows, "product_id");
      Object.entries(stock).forEach(([product_id, products]) => {
        const colorGroup = _.groupBy(products, "color_id");
        const product = products[0];

        if (product) {
          stock[product_id] = {
            product_id: product.product_id,
            product_name: product.product_name,
            type: product.type,
            gender: product.gender,
            price: product.price,
            created_at: product.created_at,
            manufacturer_id: product.manufacturer_id,
            manufacturer_name: product.manufacturer_name,
            style_id: product.style_id,
            type_id: product.type_id,
            type_name: product.type_name,
            size_type_id: product.size_type_id,

            colors: {},
          };

          Object.entries(colorGroup).forEach(([color_id, products]) => {
            const product0 = products[0];

            stock[product_id].colors[color_id] = {
              color_id: product0.color_id,
              color_name: product0.color_name,

              sizes: products.map((product) => ({
                stock_id: product.stock_id,
                color_id: product.color_id,
                quantity: product.quantity,
                size_id: product.size_id,
                size: product.size,
              })),
            };
          });
        }
      });

      if (Object.keys(stock).length > 0) {
        const products_ids = Object.keys(stock);
        const imageResult = await db.query(
          getImagesByProductsIDs(products_ids),
          products_ids
        );

        Object.keys(stock).forEach((product_id) => {
          const filteredImages = imageResult.rows.filter(
            (i) => i.product_id.trim() === product_id.trim()
          );

          const images = _.groupBy(filteredImages, "product_color_id");

          stock[product_id].images = images;
        });
      }

      res.status(200).json({
        status: "success",
        total: total,
        data: {
          stocks: stock,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: page < totalPage? page + 1 : totalPage,
            total_page: totalPage,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createProductStockHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { product_id, color_id, size_id, quantity } = req.body;

      const result = await db.query(
        "INSERT INTO stock (product_id, color_id, size_id, quantity) VALUES ($1, $2, $3, $4)",
        [product_id, color_id, size_id, quantity]
      );

      res.status(200).json({
        status: "success",
        data: {
          stock: result.rows[0],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getStockByProductIdHandler(req, res) {
    try {
      const { product_id } = req.params;

      const result = await db.query(
        `
        SELECT * FROM stock
        WHERE stock.product_id = $1
      `,
        [product_id]
      );

      const stockGroup = _.groupBy(result.rows, "color_id");

      res.status(200).json({
        status: "success",
        data: {
          stock: stockGroup,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateStockHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { stock_id } = req.params;
      const { quantity = 0 } = req.body;

      const result = await db.query(
        `
        UPDATE stock SET quantity = $1
        WHERE stock.stock_id = $2
      `,
        [quantity, stock_id]
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
