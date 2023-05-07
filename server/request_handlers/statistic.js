const _ = require("lodash");

const db = require("../db");
const { getImagesByProductsIDs } = require("../helpers");

const productsWithImages = async (rows) => {
  let products = [...rows];

  if (products.length > 0) {
    // $1, $2, ...
    const products_ids = products.map((p) => p.product_id);

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
        images,
      };
    });
  }

  return products;
};

module.exports = {
  async getStatisticHandler(req, res) {
    try {
      const { role, user_id } = req.user;

      if (role != "2" && role != "0") {
        res.status(403).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      // sales
      const salesTotalResult = await db.query(`
            SELECT SUM(orders.total_price) as total_sales from orders
        `);
      const salesLastweekResult = await db.query(`
            SELECT SUM(orders.total_price) as last_week_sales from orders
            WHERE created_at BETWEEN
                NOW()::DATE - 14
                AND NOW()::DATE - 8
        `);
      const salesThisweekResult = await db.query(`
            SELECT SUM(orders.total_price) as this_week_sales from orders
            WHERE created_at BETWEEN
                NOW()::DATE - 7
                AND NOW()
        `);
      const salesLast12MonthsResult = await db.query(`
        SELECT 
          EXTRACT(YEAR FROM created_at)::integer as year,
          EXTRACT(MONTH FROM created_at)::integer as month,
            sum(o.total_price) as sales
        FROM orders o
        WHERE created_at >
              date_trunc('month', CURRENT_DATE) - INTERVAL '1 year'
        GROUP BY EXTRACT(YEAR FROM created_at), EXTRACT(MONTH FROM created_at);
      `);
      const salesLast6WeeksResult = await db.query(`
        SELECT date_trunc('week', created_at::date) AS week_start,
          sum(o.total_price) as sales           
        FROM orders o
        WHERE created_at BETWEEN
          NOW()::DATE - (7 * 6)
          AND NOW()
        GROUP BY week_start
        ORDER BY week_start;
      `);
      const salesLast30daysResult = await db.query(`
        SELECT 
          EXTRACT(DAY FROM created_at)::integer as day,
          EXTRACT(MONTH FROM created_at)::integer as month,
          EXTRACT(YEAR FROM created_at)::integer as year,
            sum(o.total_price) as sales
        FROM orders o
        WHERE created_at >
              date_trunc('day', CURRENT_DATE) - INTERVAL '1 month'
        GROUP BY 
          EXTRACT(DAY FROM created_at),
          EXTRACT(YEAR FROM created_at),
          EXTRACT(MONTH FROM created_at);
      `);

      // orders
      const itemsTotalResult = await db.query(`
            SELECT COUNT(1)::integer as total_items from order_items
        `);
      const itemsLastweekResult = await db.query(`
            SELECT COUNT(1)::integer as last_week_items from orders
            INNER JOIN order_items ON order_items.order_id = orders.order_id
            WHERE created_at BETWEEN
                NOW()::DATE - 14
                AND NOW()::DATE - 8
        `);
      const itemsThisweekResult = await db.query(`
            SELECT COUNT(1)::integer as this_week_items from orders
            INNER JOIN order_items ON order_items.order_id = orders.order_id
            WHERE created_at BETWEEN
                NOW()::DATE - 7
                AND NOW()
        `);

      // users
      const usersTotalResult = await db.query(`
            SELECT COUNT(1)::integer as total_users FROM users
        `);
      const usersLastweekResult = await db.query(`
            SELECT COUNT(1)::integer as last_week_users from users
            WHERE TO_TIMESTAMP(registration_time / 1000) BETWEEN
                NOW()::DATE - 14
                AND NOW()::DATE - 8
        `);
      const usersThisweekResult = await db.query(`
            SELECT COUNT(1)::integer as this_week_users from users
            WHERE TO_TIMESTAMP(registration_time / 1000) BETWEEN
                NOW()::DATE - 7
                AND NOW()
        `);

      // Recent sales (last 7 days)
      const userRecentSalesResult = await db.query(`
        select users.user_id, COALESCE(first_name, '') || ' ' || COALESCE(last_name, '') as user_name, total_price, created_at, avatar from orders
        INNER JOIN users ON orders.user_id = users.user_id
        WHERE created_at BETWEEN
            NOW()::DATE - 7
            AND NOW()
        ORDER BY created_at DESC
      `);

      // Top products (limit 10)
      const topProductsResult = await db.query(`
        SELECT products.product_id, product_name, price, SUM(order_items.quantity) as sold, SUM(total_price) as sales
        FROM order_items
          INNER JOIN products ON products.product_id = order_items.product_id
        GROUP BY products.product_id
        ORDER BY sold DESC, sales DESC
        LIMIT 10
      `);
      const topProducts = await productsWithImages(topProductsResult.rows);

      res.status(200).json({
        status: "success",
        data: {
          sales: {
            total: salesTotalResult.rows[0].total_sales,
            this_week: salesThisweekResult.rows[0].this_week_sales,
            last_week: salesLastweekResult.rows[0].last_week_sales,
          },
          items: {
            total: itemsTotalResult.rows[0].total_items,
            this_week: itemsThisweekResult.rows[0].this_week_items,
            last_week: itemsLastweekResult.rows[0].last_week_items,
          },
          users: {
            total: usersTotalResult.rows[0].total_users,
            this_week: usersThisweekResult.rows[0].this_week_users,
            last_week: usersLastweekResult.rows[0].last_week_users,
          },
          last_12_months: {
            sales: salesLast12MonthsResult.rows,
          },
          last_6_weeks: {
            sales: salesLast6WeeksResult.rows,
          },
          last_30_days: {
            sales: salesLast30daysResult.rows,
          },
          user_recent_sales: userRecentSalesResult.rows,
          top_products: topProducts,
        },
      });
    } catch (err) {
      res.sendStatus(500);
      console.log(err);
    }
  },
};
