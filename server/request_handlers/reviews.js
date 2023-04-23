require("dotenv").config();

const db = require("../db");

module.exports = {
  async getReviewsByProductIDHandler(req, res) {
    try {
      //pagination
      let { page = 1 } = req.query;

      page = Number(page);

      if (Number.isNaN(page) || page <= 0) page = 1;

      const reviews_per_page = 10;
      const from = (page - 1) * reviews_per_page;
      const to = (page + 1) * reviews_per_page;

      const { productId } = req.params;
      const totalResult = await db.query(
        `SELECT COUNT(1) as total, AVG(reviews.rating) as avg FROM reviews 
            INNER JOIN users ON reviews.user_id = users.user_id
            WHERE reviews.product_id = $1`,
        [productId]
      );
      const result = await db.query(
        `SELECT reviews.product_id, reviews.user_id, review, rating, created_at, title, (coalesce(users.first_name, '') || ' ' || coalesce(users.last_name, '')) as user_name FROM reviews 
            INNER JOIN users ON reviews.user_id = users.user_id
            WHERE reviews.product_id = $1
            ORDER BY reviews.created_at DESC
            LIMIT $2 OFFSET $3`,
        [productId, reviews_per_page, from]
      );

      res.status(200).json({
        status: "success",
        data: {
          reviews: result.rows,
        },
        meta: {
          total: totalResult.rows[0].total || 0,
          totalPage: Math.ceil(
            (totalResult.rows[0].total || 0) / reviews_per_page
          ),
          avg: totalResult.rows[0].avg || 0,
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: result.rows.length === 0 ? page : page + 1,
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createReviewHandler(req, res) {
    try {
      const { user_id } = req.user;
      const { productId, review, rating, title = "" } = req.body;

      if (!productId || !review || !rating) {
        res.status(409).json({
          status: "error",
          error: "Missing required parameter",
        });

        return;
      }

      const checkReviewExists = await db.query(
        "SELECT product_id FROM reviews WHERE user_id = $1 AND product_id = $2",
        [user_id, productId]
      );

      if (checkReviewExists.rows.length > 0) {
        res.status(409).json({
          status: "error",
          error: "Sorry. You already made a review for this product.",
        });

        return;
      }

      const result = await db.query(
        `INSERT INTO reviews (product_id, user_id, review, rating, title)
          VALUES ($1, $2, $3, $4, $5) returning *`,
        [productId, user_id, review, rating, title]
      );

      res.status(200).json({
        status: "success",
        data: {
          review: result.rows,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
};
