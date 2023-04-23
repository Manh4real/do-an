require("dotenv").config();

const jwt = require("jsonwebtoken");

const express = require("express");
const morgan = require("morgan");
const cors = require("cors");

const db = require("../db");

// bcrypt
const bcrypt = require("bcrypt");
const saltRounds = 10;

// end - bcrypt

const app = express();

// use middlewares
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());

// USER
// sign in
app.post("/auth/signin", async (req, res) => {
  try {
    const { email, password: plainPassword } = req.body;

    const response = await db.query(
      `SELECT user_id, password, first_name, last_name, birthday, country, registration_time, role 
			FROM users WHERE users.email = $1`,
      [email]
    );

    if (response.rows.length === 0) {
      res.status(401).json({
        status: "error",
        message: "Incorrect email or password",
      });
    } else {
      const { user_id, role, password: hashPassword } = response.rows[0];

      // check password
      bcrypt.compare(plainPassword, hashPassword, function (err, result) {
        // result == true
        if (err) {
          res.sendStatus(500);
          console.log(err);
          return;
        }

        if (result === false) {
          res.status(401).json({
            status: "error",
            message: "Wrong password",
          });
          return;
        }

        // Password is match
        const payload = { user_id, role };
        const accessToken = generateAccessToken(payload);

        res.status(200).json({ accessToken });
      });
      // end - check password
    }
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});
// sign in (admin/manager)
app.post("/auth/a/signin", async (req, res) => {
  try {
    const { email, password: plainPassword } = req.body;
    const response = await db.query(
      `SELECT user_id, password, first_name, last_name, birthday, country, registration_time, role 
			FROM users WHERE users.email = $1`,
      [email]
    );

    if (response.rows.length === 0) {
      res.status(401).json({
        status: "error",
        message: "Incorrect email or password",
      });
      return;
    } else {
      const role = response.rows[0].role;

      if (role !== "0" && role !== "2") {
        res.status(401).json({
          status: "error",
          message: "You are not allowed",
        });
        return;
      }

      if (role === "0" || role === "2") {
        const { user_id, role, password: hashPassword } = response.rows[0];

        bcrypt.compare(plainPassword, hashPassword, function (err, result) {
          if (err) {
            res.sendStatus(500);
            console.log(err);

            return;
          }

          if (result === false) {
            res.status(401).json({
              status: "error",
              message: "Invalid password",
            });
            return;
          }

          const payload = { user_id, role };
          const accessToken = generateAccessToken(payload);

          res.status(200).json({ status: "success", accessToken });
        });

        return;
      }

      res.status(500).json({
        status: "error",
        message: "Something went wrong",
      });
      return;
    }
  } catch (err) {
    console.log(err);
    res.sendStatus(500);
  }
});

// sign up
app.post("/auth/signup", async (req, res) => {
  try {
    const {
      email,
      password,
      first_name,
      last_name,
      birthday,
      country,
      registration_time,
      with_email,
    } = req.body;

    const checkEmailExistResult = await db.query(
      `
      SELECT COUNT(1) as email_count FROM users
      WHERE users.email = $1
    `,
      [email]
    );

    if (checkEmailExistResult.rows[0].email_count > 0) {
      res.status(409).json({
        status: "error",
        message: "Email has already been used",
      });

      return;
    }

    // hash
    try {
      bcrypt.hash(password, saltRounds, async function (err, hash) {
        // Store hash in your password DB.
        // console.log({ hash });
        if (err) {
          res.sendStatus(500);
          console.log(err);
          return;
        }

        const response = await db.query(
          `INSERT INTO users (email, password, first_name, last_name, birthday, country, registration_time, with_email) 
				VALUES ($1, $2, $3, $4, $5, $6, $7, $8) returning *`,
          [
            email,
            hash,
            first_name,
            last_name,
            birthday,
            country,
            registration_time,
            with_email,
          ]
        );

        const { user_id } = response.rows[0];

        const payload = { user_id };
        const accessToken = generateAccessToken(payload);

        res.json({ accessToken });
      });
    } catch (err) {
      console.log("Error: Bcrypt hash", err);
    }
  } catch (err) {
    console.log(err);

    res.sendStatus(500);
  }
});

function generateAccessToken(user) {
  return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, { expiresIn: "30d" });
}

const PORT = 4000;

app.listen(PORT, () => {
  console.log(`Auth Server is up and listening on port ${PORT}...`);
});
