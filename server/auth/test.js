const bcrypt = require("bcrypt");

bcrypt.hash("admin", 10, async function (err, hash) {
  console.log(hash);
});
