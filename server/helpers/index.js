module.exports = {
  updateProductByID(id, cols) {
    // Setup static beginning of query
    var query = ["UPDATE products"];
    query.push("SET");

    // Create another array storing each set command
    // and assigning a number value for parameterized query
    var set = [];
    Object.keys(cols).forEach(function (key, i) {
      set.push(key + " = ($" + (i + 1) + ")");
    });
    query.push(set.join(", "));

    // Add the WHERE statement to look up by id
    // and returning updated row
    query.push("WHERE product_id = " + id + " returning *");

    // Return a complete query string
    return query.join(" ");
  },
  getImagesByProductsIDs(products_ids) {
    const s = [];
    products_ids.forEach(function (value, i) {
      s.push("$" + (i + 1));
    });

    let query =
      "SELECT * FROM images WHERE images.product_id IN (" + s.join(",") + ") ";
    return query;
  },
  getProductsByIDs(products_ids) {
    const s = [];
    products_ids.forEach(function (_, i) {
      s.push("$" + (i + 1));
    });

    let query = `SELECT * FROM products 
      INNER JOIN manufacturers ON products.manufacturer_id = manufacturers.manufacturer_id
      INNER JOIN styles ON products.style_id = styles.style_id
      INNER JOIN types ON types.type_id = products.type_id
      WHERE products.product_id IN (${s.join(",")})`;

    return query;
  },
  updateUserByID(id, cols) {
    // Setup static beginning of query
    var query = ["UPDATE users"];
    query.push("SET");

    // Create another array storing each set command
    // and assigning a number value for parameterized query
    var set = [];
    Object.keys(cols).forEach(function (key, i) {
      set.push(key + " = ($" + (i + 1) + ")");
    });
    query.push(set.join(", "));

    // Add the WHERE statement to look up by id
    // and returning updated row
    query.push("WHERE user_id = " + id + " returning *");

    // Return a complete query string
    return query.join(" ");
  },
};
