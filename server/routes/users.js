const express = require("express");
const { authenticateToken } = require("../middlewares");

const routes = express.Router();

const {
  getUserAvatarHandler,
  getUsersHandler,
  createNewUserHandler,
  updateUserHandler,
  deleteUserHandler,
  searchUsersHandler,
  changePasswordHandler,
} = require("../request_handlers/users");

routes.get("/avatar", authenticateToken, getUserAvatarHandler);

routes.get("/", authenticateToken, getUsersHandler);
routes.get("/search", authenticateToken, searchUsersHandler);

// create new user
routes.post("/", authenticateToken, createNewUserHandler);
// update user
routes.put("/:id", authenticateToken, updateUserHandler);
// delete user
routes.post("/delete/:id", authenticateToken, deleteUserHandler);
// user change password
routes.post("/change_password", authenticateToken, changePasswordHandler);

module.exports = routes;
