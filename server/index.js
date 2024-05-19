require("dotenv").config();

const express = require("express");
const morgan = require("morgan");
const cors = require("cors");
const routes = require("./routes");

// const { saveObjects } = require("./algolia_search");

const initFns = require("./request_handlers/init");

const app = express();

// use middlewares
app.use(morgan("dev"));
app.use(cors());
app.use(express.json());

// initFns.initTables();
app.use("/api/v1", routes);

const PORT = process.env.PORT || 3005;

app.listen(PORT, () => {
  console.log(`Server is up and listening on port ${PORT}...`);
});
