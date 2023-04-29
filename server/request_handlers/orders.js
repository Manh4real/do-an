require("dotenv").config();
const db = require("../db");
const _ = require("lodash");

const { THREE_DAYS_TIME } = require("../constants");

const { getProductsByIDs, getImagesByProductsIDs } = require("../helpers");

module.exports = {
  async getCurrentUserOrdersHandler(req, res) {
    try {
      // pagination
      // let { page = 1 } = req.query;

      // page = Number(page);

      // if (Number.isNaN(page) || page <= 0) page = 1;

      // const orders_per_page = 10;
      // const from = (page - 1) * orders_per_page;
      // const to = (page + 1) * orders_per_page;
      // end

      const { user_id } = req.user;

      const result = await db.query(
        `SELECT 
        orders.order_id, status, orders.order_status_id, order_status_name, address, phone, 
        receiver, email, est_arrived_date, created_at, 
        orders.total_price, order_item_id, product_id, 
        order_items.color_id, quantity, size, color_name
        FROM orders 
        INNER JOIN order_items ON orders.order_id = order_items.order_id
        INNER JOIN order_statuses ON orders.order_status_id = order_statuses.order_status_id
        INNER JOIN colors ON order_items.color_id = colors.color_id
        WHERE orders.user_id = $1
        ORDER BY orders.created_at DESC
        `,
        [user_id]
      );
      let orders = result.rows;

      if (orders.length > 0) {
        const p_ids = orders.map((f) => f.product_id);
        const products_ids = _.uniqBy(p_ids, (id) => id);
        const productsQuery = getProductsByIDs(products_ids);
        const productsResult = await db.query(productsQuery, products_ids);

        let products = productsResult.rows;

        // get products' images
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
            const orderItem =
              orders.find((item) => item.product_id === p.product_id) || [];
            return {
              ...p,
              ordered: {
                ...orderItem,
              },
              sizes: p.sizes.split(",").map((s) => s.trim()),
              images: images,
            };
          });
        }

        orders = orders.map((order) => {
          const product = products.find(
            (p) => p.product_id === order.product_id
          );

          return {
            ...order,
            product,
          };
        });
      }
      const orderGroups = _.groupBy(orders, "order_id");

      // if (orders.length > 0) {
      //   //   const totalOrderItem = await db.query(
      //   //     `
      //   //   SELECT COUNT(1) as total FROM order_items
      //   //   WHERE order_items.order_id = $1
      //   // `,
      //   //     [orders.order_id]
      //   //   );
      //   // const total = totalOrderItem.rows[0]["total"];
      //   // LIMIT $${orderIds.length + 1} OFFSET $${orderIds + 2}

      //   const values = [];
      //   let query = orders.map(({ order_id }, i) => {
      //     let s = "$" + (i + 1);

      //     values.push(order_id);

      //     return s;
      //   });
      //   query = query.join(", ");
      //   const orderIds = orders.map(({ order_id }) => order_id);

      //   const orderItemsResult = await db.query(
      //     `
      //   SELECT order_item_id, order_items.order_id, product_id, color_id, quantity, order_items.status as item_status FROM order_items
      //   INNER JOIN orders ON orders.order_id = order_items.order_id
      //   WHERE order_items.order_id IN (${q})
      //   `,
      //     orderIds
      //   );

      //   /*
      // INNER JOIN products ON products.product_id = order_items.product_id
      // INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
      // */
      //   const orderItems = orderItemsResult.rows;
      //   const orderGroups = _.groupBy(orderItems, "order_id");

      //   if (orderItems.length > 0) {

      //     finalOrders.products = products;
      //   }
      // }

      res.status(200).json({
        status: "success",
        data: {
          orders: orderGroups,
        },
        // total: total,
        // meta: {
        //   pagination: {
        //     current_page: page,
        //     previous_page: page <= 1 ? 1 : page - 1,
        //     next_page: orderItems.length < orders_per_page ? page : page + 1,
        //     total_page: Math.ceil(total / orders_per_page),
        //   },
        // },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getOrdersHandler(req, res) {
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
      let { page = 1, status = 1 } = req.query;

      // page = Number(page);

      // if (Number.isNaN(page) || page <= 0) page = 1;

      // const orders_per_page = 10;
      // const from = (page - 1) * orders_per_page;
      // const to = (page + 1) * orders_per_page;

      const totalResult = await db.query(`
        SELECT COUNT(1) as total FROM ORDERS;
      `);
      const result = await db.query(
        `SELECT 
        orders.order_id, status, orders.order_status_id, order_status_name, address, phone, 
        receiver, orders.email, est_arrived_date, created_at, 
        orders.total_price, order_item_id, product_id, 
        order_items.color_id, quantity, size, color_name,
        (coalesce(users.first_name, '') || ' ' || coalesce(users.last_name, '')) as customer_name
        FROM orders 
        INNER JOIN order_items ON orders.order_id = order_items.order_id
        INNER JOIN order_statuses ON orders.order_status_id = order_statuses.order_status_id
        INNER JOIN colors ON order_items.color_id = colors.color_id
        INNER JOIN users ON orders.user_id = users.user_id
        WHERE orders.order_status_id = $1
        ORDER BY orders.created_at DESC
        `,
        [status]
      );
      let orders = result.rows;

      if (orders.length > 0) {
        const p_ids = orders.map((f) => f.product_id);
        const products_ids = _.uniqBy(p_ids, (id) => id);
        const productsQuery = getProductsByIDs(products_ids);
        const productsResult = await db.query(productsQuery, products_ids);

        let products = productsResult.rows;

        // get products' images
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
            const orderItem =
              orders.find((item) => item.product_id === p.product_id) || [];
            return {
              ...p,
              ordered: {
                ...orderItem,
              },
              sizes: p.sizes.split(",").map((s) => s.trim()),
              images: images,
            };
          });
        }

        orders = orders.map((order) => {
          const product = products.find(
            (p) => p.product_id === order.product_id
          );

          return {
            ...order,
            product,
          };
        });
      }
      const orderGroups = _.groupBy(orders, "order_id");

      res.status(200).json({
        status: "success",
        data: {
          orders: orderGroups,
        },
        total: totalResult.rows[0].total || 0,
        // meta: {
        //   pagination: {
        //     current_page: page,
        //     previous_page: page <= 1 ? 1 : page - 1,
        //     next_page: orderItems.length < orders_per_page ? page : page + 1,
        //     total_page: Math.ceil(total / orders_per_page),
        //   },
        // },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async searchOrdersHandler(req, res) {
    res.status(200).json({
      message: "Nothing here",
    });
  },
  async getOrderByIdHandler(req, res) {
    try {
      // const { role } = req.user;

      // if (role != "2" && role != "0") {
      //   res.status(405).json({
      //     status: "error",
      //     error: "You are not allowed",
      //   });
      //   return;
      // }

      const { orderId } = req.params;

      const result = await db.query(
        `SELECT 
        orders.order_id, status, orders.order_status_id, order_status_name, address, phone, 
        receiver, orders.email, est_arrived_date, created_at, 
        orders.total_price, order_item_id, product_id, 
        order_items.color_id, quantity, size, color_name, (coalesce(users.first_name, '') || ' ' || coalesce(users.last_name, '')) as customer_name
        FROM orders 
        INNER JOIN order_items ON orders.order_id = order_items.order_id
        INNER JOIN order_statuses ON orders.order_status_id = order_statuses.order_status_id
        INNER JOIN colors ON order_items.color_id = colors.color_id
		    INNER JOIN users ON orders.user_id = users.user_id
        WHERE orders.order_id = $1
        `,
        [orderId]
      );
      let orders = result.rows;

      if (orders.length > 0) {
        const p_ids = orders.map((f) => f.product_id);
        const products_ids = _.uniqBy(p_ids, (id) => id);
        const productsQuery = getProductsByIDs(products_ids);
        const productsResult = await db.query(productsQuery, products_ids);

        let products = productsResult.rows;

        // get products' images
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
            const orderItem =
              orders.find((item) => item.product_id === p.product_id) || [];
            return {
              ...p,
              ordered: {
                ...orderItem,
              },
              sizes: p.sizes.split(",").map((s) => s.trim()),
              images: images,
            };
          });
        }

        orders = orders.map((order) => {
          const product = products.find(
            (p) => p.product_id === order.product_id
          );

          return {
            ...order,
            product,
          };
        });
      }
      const orderGroups = _.groupBy(orders, "order_id");

      res.status(200).json({
        status: "success",
        data: {
          order: orderGroups[orderId],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createOrderHandler(req, res) {
    try {
      const { user_id } = req.user;
      const { products, receiver, address, email = "", phone } = req.body;
      const estArrivedDate = new Date(Date.now() + THREE_DAYS_TIME);

      if (products.length === 0) {
        res.status(409).json({
          status: "error",
          error: "Products are required",
        });
        return;
      }

      const subtotal =
        products.reduce(
          (acc, product) =>
            acc + Number(product.price * product.added.quantity),
          0
        ) || 0;
      const shipping = 8;
      const tax = 0;
      const total_price = subtotal + shipping + tax;

      const response = await db.query(
        `INSERT INTO orders (user_id, receiver, address, phone, email, total_price, est_arrived_date)
        VALUES ($1, $2, $3, $4, $5, $6, $7) returning *`,
        [user_id, receiver, address, phone, email, total_price, estArrivedDate]
      );

      // update product stock & sales
      (function () {
        const promises = [];

        for (let i = 0; i < products.length; i++) {
          const product = products[i];

          // update product sales
          const updateProductsSalesResult = db.query(
            `
            UPDATE products 
            SET sales = sales + $1
            WHERE products.product_id = $2
          `,
            [+product.added.quantity, product.product_id]
          );

          promises.push(updateProductsSalesResult);

          // update product stock
          const updateProductsStockResult = db.query(
            `
            UPDATE stock 
            SET quantity = quantity - $1
            WHERE stock.product_id = $2 AND stock.color_id = $3 AND stock.size_id = $4
          `,
            [
              +product.added.quantity,
              product.product_id,
              product.added.colorId,
              product.added.size.size_id,
            ]
          );

          promises.push(updateProductsStockResult);
        }
        // end - update product stock

        Promise.all(promises)
          .then((a) => {
            console.log("Updated product sales & stock.");
          })
          .catch((err) => {
            console.log("Error: Can't update product sales & stock.", err);
          });
      })();
      // end - update product stock & sales

      const addedOrder = response.rows[0];

      let j = 0;
      const values = [];
      let query = products.map(
        ({ product_id, price, added: { colorId, quantity, size } }, i) => {
          let s =
            "($" +
            (i + j + 1) +
            ",$" +
            (i + j + 2) +
            ",$" +
            (i + j + 3) +
            ",$" +
            (i + j + 4) +
            ",$" +
            (i + j + 5) +
            ",$" +
            (i + j + 6) +
            ",$" +
            (i + j + 7) +
            ")";

          const total_price = price * quantity;

          values.push(
            +addedOrder.order_id,
            +product_id,
            +colorId,
            quantity,
            size.size,
            size.size_id,
            total_price
          );

          j += 6;

          return s;
        }
      );
      query = query.join(", ");

      const insertOrderItemsResult = await db.query(
        `
        INSERT INTO order_items (order_id, product_id, color_id, quantity, size, size_id, total_price)
        VALUES ${query} RETURNING *
      `,
        values
      );

      // const productResult = await db.query(
      //   "SELECT * FROM products WHERE products.product_id = $1",
      //   [addedOrder.product_id]
      // );
      // let product = productResult.rows[0];

      // const imageResult = await db.query(
      //   "SELECT * FROM images WHERE images.product_id = $1",
      //   [product.product_id]
      // );

      // const images = imageResult.rows;
      // const groupedImages = _.groupBy(images, "product_color_id");

      res.status(200).json({
        status: "success",
        data: {
          order_id: addedOrder.order_id,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateOrderHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { status, arrivedDate } = req.body;
      const { orderId } = req.params;

      if (status && arrivedDate) {
        const result = await db.query(
          `
          UPDATE orders SET order_status_id = $1, est_arrived_date = $2
          WHERE orders.order_id = $3
        `,
          [status, arrivedDate, orderId]
        );

        res.sendStatus(204);
      } else {
        res.status(409).json({
          status: "error",
          error: "Order status and arrived date id is required",
        });
      }
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteOrderHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { orderId } = req.params;

      // delete order items
      const deleteOrderItemsResult = await db.query(
        `
        DELETE FROM order_items WHERE order_items.order_id = $1
      `,
        [orderId]
      );

      const deleteOrderResult = await db.query(
        `
        DELETE FROM orders WHERE orders.order_id = $1
      `,
        [orderId]
      );

      res.sendStatus(204);
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
