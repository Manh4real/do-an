require("dotenv").config();

const bcrypt = require("bcrypt");

const { updateUserByID } = require("../helpers");
const { DEFAULT_AVATAR } = require("../constants");

const db = require("../db");
const saltRounds = 10;

module.exports = {
  async getCurrentUserHandler(req, res) {
    try {
      const { user_id } = req.user;
      const result = await db.query(
        `SELECT user_id, email, first_name, last_name, birthday, country, registration_time, avatar, role 
            FROM users
            WHERE users.user_id = $1`,
        [user_id]
      );

      const user = result.rows[0];

      if (user) {
        res.status(200).json({
          status: "success",
          data: {
            user: {
              ...result.rows[0],
              name: {
                firstName: result.rows[0].first_name,
                lastName: result.rows[0].last_name,
              },
            },
          },
        });
      } else {
        res.status(404).json({
          status: "error",
          error: "Invalid email or password",
        });
      }
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateCurrentUserHandler(req, res) {
    try {
      const { user_id } = req.user;
      const colValues = Object.keys(req.body).map(function (key) {
        return req.body[key];
      });

      const response = await db.query(
        updateUserByID(user_id, req.body),
        colValues
      );
      const user = response.rows[0];

      if (user) {
        res.status(200).json({
          status: "success",
          data: {
            user: {
              ...response.rows[0],
              name: {
                firstName: response.rows[0].first_name,
                lastName: response.rows[0].last_name,
              },
            },
          },
        });
      } else {
        res.status(404).json({
          status: "error",
          error: "Invalid email or password",
        });
      }
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getUserAvatarHandler(req, res) {
    try {
      const { user_id } = req.user;
      const result = await db.query(
        `SELECT avatar 
        FROM users
        WHERE users.user_id = $1`,
        [user_id]
      );

      const user = result.rows[0];

      if (user) {
        res.status(200).json({
          status: "success",
          data: {
            user_avatar: user.avatar,
          },
        });
      } else {
        res.status(404).json({
          status: "error",
          error: "Not found",
        });
      }
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async getUsersHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      let { page = 1 } = req.query;

      page = Number(page);

      if (Number.isNaN(page) || page <= 0) page = 1;

      const users_per_page = 4;
      const from = (page - 1) * users_per_page;
      const to = (page + 1) * users_per_page;

      const total_result = await db.query(
        `SELECT COUNT(1) as total FROM users`
      );
      const result = await db.query(
        `SELECT users.user_id, users.email, users.first_name, users.last_name, users.birthday, users.country, users.registration_time, users.avatar, users.role FROM users ORDER BY users.registration_time DESC, users.first_name ASC, users.last_name ASC LIMIT $1 OFFSET $2`,
        [users_per_page, from]
      );

      const users = result.rows;

      res.status(200).json({
        status: "success",
        total: total_result.rows[0]["total"] || 0,
        data: {
          users: users,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: users.length < users_per_page ? page : page + 1,
            total_page: Math.ceil(
              (total_result.rows[0]["total"] || 0) / users_per_page
            ),
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async searchUsersHandler(req, res) {
    try {
      const { role } = req.user;

      if (role != "2" && role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      let { page = 1, q = "" } = req.query;

      page = Number(page);
      q = q.trim();

      if (Number.isNaN(page) || page <= 0) page = 1;

      const users_per_page = 4;
      const from = (page - 1) * users_per_page;
      const to = (page + 1) * users_per_page;

      const total_result = await db.query(
        `SELECT COUNT(1) as total FROM users
          WHERE users.email LIKE ($1 || '%')
        `,
        [q]
      );
      const result = await db.query(
        `SELECT users.user_id, users.email, users.first_name, users.last_name, users.birthday, users.country, users.registration_time, users.avatar, users.role FROM users 
          WHERE users.email LIKE ($1 || '%')
          ORDER BY users.registration_time DESC, users.first_name ASC, users.last_name ASC
          LIMIT $2 OFFSET $3`,
        [q, users_per_page, from]
      );

      const users = result.rows;

      res.status(200).json({
        status: "success",
        total: total_result.rows[0]["total"] || 0,
        data: {
          users: users,
        },
        meta: {
          pagination: {
            current_page: page,
            previous_page: page <= 1 ? 1 : page - 1,
            next_page: users.length < users_per_page ? page : page + 1,
            total_page: Math.ceil(
              (total_result.rows[0]["total"] || 0) / users_per_page
            ),
          },
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async createNewUserHandler(req, res) {
    try {
      const { role: _role } = req.user;

      if (_role != "2" && _role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const {
        email,
        first_name,
        last_name,
        birthday,
        password,
        country,
        avatar = "default-avatar.png",
        role,
        registration_time = Date.now(),
      } = req.body;

      const checkEmail = await db.query(
        `SELECT COUNT(1) as count FROM users WHERE users.email = $1`,
        [email]
      );
      const count = checkEmail.rows[0].count;
      if (count >= 1) {
        res.status(409).json({
          status: 409,
          error: "The email has already been used",
        });

        return;
      }

      const result = await db.query(
        `INSERT INTO users (email, password, first_name, last_name, birthday, country, avatar, role, registration_time) 
                  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) returning *`,
        [
          email,
          password,
          first_name,
          last_name,
          birthday,
          country,
          avatar,
          role,
          registration_time,
        ]
      );

      res.status(201).json({
        status: "success",
        data: {
          user: result.rows[0],
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async updateUserHandler(req, res) {
    try {
      const { role: _role } = req.user;

      if (_role != "2" && _role != "0") {
        res.status(405).json({
          status: "error",
          error: "You are not allowed",
        });
        return;
      }

      const { email } = req.body;
      const { id: user_id } = req.params;

      const checkEmail = await db.query(
        `SELECT COUNT(1) as count FROM users WHERE users.email = $1 AND users.user_id != $2`,
        [email, user_id]
      );
      const count = checkEmail.rows[0].count;
      if (count >= 1) {
        res.status(409).json({
          status: 409,
          error: "The email has already been used",
        });

        return;
      }

      const updatedFields = {
        email: req.body.email,
        first_name: req.body.first_name,
        last_name: req.body.last_name,
        birthday: req.body.birthday,
        // password: req.body.password,
        country: req.body.country,
        avatar: req.body.avatar,
        role: req.body.role,
      };

      const addition = {};

      if (!updatedFields.avatar) {
        delete updatedFields.avatar;
      } else {
        // get old avatar to delete from Firebase Storage
        const getOldAvatarNameResult = await db.query(
          `SELECT avatar FROM users WHERE users.user_id = $1`,
          [user_id]
        );

        const oldAvatar = getOldAvatarNameResult.rows[0].avatar;
        if (oldAvatar !== DEFAULT_AVATAR) {
          addition["old_avatar"] = oldAvatar;
        }
      }

      const colsValues = Object.values(updatedFields);
      const result = await db.query(
        updateUserByID(user_id, updatedFields),
        colsValues
      );

      res.status(201).json({
        status: "success",
        data: {
          user: result.rows[0],
          addition,
        },
      });
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async deleteUserHandler(req, res) {
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

      // delete orders of user
      // const deleteOrderResult = await db.query(
      //   "DELETE FROM orders WHERE orders.user_id = $1",
      //   [id]
      // );
      // delete reviews of user
      const deleteReviewsResult = await db.query(
        "DELETE FROM reviews WHERE reviews.user_id = $1",
        [id]
      );

      // delete favorites of user
      const deleteFavoritesResult = await db.query(
        "DELETE FROM favorites WHERE favorites.user_id = $1",
        [id]
      );

      // get avatar name to delete avatar from Firebase Storage
      const getUserAvatarResult = await db.query(
        "SELECT avatar FROM users WHERE users.user_id = $1",
        [id]
      );
      const userAvatar = getUserAvatarResult.rows[0]["avatar"];

      // delete user
      const result = await db.query(
        "DELETE FROM users WHERE users.user_id = $1",
        [id]
      );

      if (userAvatar === DEFAULT_AVATAR) {
        res.status(200).json({ status: "success" });
      } else {
        res.status(200).json({
          status: "success",
          data: {
            user: {
              avatar: userAvatar,
            },
          },
        });
      }
    } catch (err) {
      console.log(err);
      res.sendStatus(500);
    }
  },
  async changePasswordHandler(req, res) {
    try {
      const { user_id } = req.user;
      const {
        oldPassword: oldPlainPassword = "",
        newPassword: newPlainPassword = "",
      } = req.body;

      const selectUserResult = await db.query(
        `
        SELECT password FROM users
        WHERE users.user_id = $1
      `,
        [user_id]
      );

      const user = selectUserResult.rows[0];

      if (!user) {
        res.status(404).json({
          status: "error",
          message: "User doesn't exist",
        });
        return;
      }

      bcrypt.compare(
        oldPlainPassword,
        user.password.trim(),
        function (err, result) {
          if (err) {
            console.log("Error: in bcrypt compare (Change password)");
            res.sendStatus(500);
            return;
          }

          if (!result) {
            res.status(409).json({
              status: "error",
              message: "Invalid password",
            });
            return;
          }

          bcrypt.hash(newPlainPassword, saltRounds, async function (err, hash) {
            if (err) {
              console.log("Error: in bcrypt hash (Change password)");
              res.sendStatus(500);

              return;
            }

            try {
              const changePasswordResult = await db.query(
                `
                  UPDATE users SET password = $1
                  WHERE users.user_id = $2
                `,
                [hash, user_id]
              );

              res.sendStatus(204);
            } catch (err) {
              res.sendStatus(500);
            }
          });
        }
      );
    } catch (err) {
      res.sendStatus(500);
      console.log(err);
    }
  },
};
