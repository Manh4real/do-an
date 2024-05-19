const db = require("../db");

module.exports = {
  async initTables() {
    await this.initProductsTable();
    await this.initUsersTable();
    await this.initImagesTable();
    await this.initColorsTable();
    await this.initFavoritesTable();
    await this.initReviewsTable();
    await this.initManufacturersTable();
    await this.initStylesTable();
    await this.initOrdersTable();
    await this.initOrderItemsTable();
    await this.initStockTable();

    await this.alterTables();
  },
  async initProductsTable() {
    await db.query(`
        CREATE TABLE products (
            product_id bigserial NOT NULL PRIMARY KEY,
            category VARCHAR(50) NOT NULL,
            product_name VARCHAR(50) NOT NULL,
            type CHAR(20) NOT NULL,
            gender CHAR(10) NOT NULL,
            target CHAR(20) NOT NULL,
            color_num INT NOT NULL,
            price FLOAT NOT NULL,
            on_sale BOOLEAN NOT NULL,
            old_price FLOAT,
            sizes CHAR(50) NOT NULL,
            featured BOOLEAN,
            manufacturer_id bigint DEFAULT 1 REFERENCES manufacturers(id),
            sales int DEFAULT 0,
            quantity int NOT NULL DEFAULT 1,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            description TEXT DEFAULT ''
        );
    `);

    await db.query(`INSERT INTO products (category, product_name, type, gender, target, color_num, price, on_sale, old_price, sizes)
      VALUES
          ('Classic Leggings', 'Adidas Yoga Studio Leggings', 'pants', 'female', E'Female\'s Sportswear', 1, 100, false, 100, 'S, M, L, XL'),
          ('Leggings', 'Techfit Period Proof Leggings', 'pants', 'female', E'Female\'s Sportswear', 1, 30, false, 30, 'S, M, L, XL'),
          ('Sport Shoes', 'Adicross Hi Boost Golf Shoes', 'shoes', 'male', 'Golf Shoes', 2, 200, false, 200, '6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11'),
          ('Sport Shoes', 'Adidas 4d FWD Shoes', 'shoes', 'male', 'FWD Shoes', 2, 200, false, 200, '6.5, 7, 7.5, 8, 8.5, 9, 9.5, 10, 10.5, 11');
      `);
  },
  async initUsersTable() {
    await db.query(`
        CREATE TABLE users (
            user_id bigserial NOT NULL PRIMARY KEY,
            email CHAR(50) NOT NULL,
            password CHAR(50) NOT NULL,
            first_name CHAR(10),
            last_name CHAR(10),
            birthday DATE,
            country CHAR(20),
            registration_time bigint NOT NULL,
            with_email BOOLEAN
        );
    `);

    await db.query(`
        create table roles (
            role_id bigserial NOT NULL PRIMARY KEY,
            role_name varchar(10)
        );
    `);

    await db.query(`
        create table user_roles (
            user_id bigint NOT NULL,
            role_id bigint NOT NULL default 1,
            
            primary key(user_id, role_id),
            foreign key (user_id) references users(user_id),
            foreign key (role_id) references roles(role_id)
        );
    `);

    await db.query(`
        INSERT INTO users (email, password, first_name, last_name, birthday, country, registration_time, with_email) VALUES 
            ('phungvi@gmail.com', 'abcABC123', 'Vi', 'Phung', '2022-02-10'::date, 'US', 1644665202923, false),
            ('nguyenthang@gmail.com', 'abcABC123', 'Thang', 'Nguyen', '2022-02-12'::date, 'US', 1644665202923, false),
            ('nguyencuong@gmail.com', 'abcABC123', 'Cuong', 'Nguyen', '2022-02-14'::date, 'US', 1644665202923, true),
            ('nguyenmanh@gmail.com', 'abcABC123', 'Manh', 'Nguyen', '2022-02-16'::date, 'US', 1644665202923, false);
    `);
  },
  async initImagesTable() {
    await db.query(`
            CREATE TABLE images (
                image_id bigserial NOT NULL PRIMARY KEY,
                url TEXT NOT NULL,
                product_id bigserial,
                FOREIGN KEY(product_id) REFERENCES products(id)
            );
        `);

    await db.query(`
        CREATE TABLE products_images (
            product_id int references products(id),
            image_id int references images(id),
            display_order smallint not null default 0
        );
    `);

    await db.query(`
        INSERT INTO images (url, product_id, product_color_id)
        VALUES
            ('adilette-aqua-slides27-a24d2705-4f14-4f50-80b7-c8e6ff56fd39.jpg', 6, 8),
            ('adilette-aqua-slides28-85f5b667-78cc-42c3-b7c6-ffd0159f3859.jpg', 6, 8),
            ('adilette-aqua-slides29-5f7f1a30-5b99-47fe-8403-f2271d097a6e.jpg', 6, 2),
            ('adilette-aqua-slides4-ad81c681-04a5-4b04-9c5a-0b1cf833bf1c.jpg', 6, 8),
            ('adilette-aqua-slides10-65c64abe-b15b-4fc3-8310-dddee3526d5d.jpg', 6, 1),
            ('adilette-aqua-slides11-6fcbaa02-86f7-45d7-bb30-bd05c77f009c.jpg', 6, 1),
            ('adilette-aqua-slides12-c124d1b4-b0ee-4a82-bfbd-dcc7f303dab8.jpg', 6, 2),
            ('adilette-aqua-slides14-56e638b1-512e-4fa3-bc72-02271a30363b.jpg', 6, 8),
            ('adilette-aqua-slides16-db1a05d6-1767-4248-88a9-c848257186ad.jpg', 6, 8),
            ('adilette-aqua-slides17-7511e9a4-dcdb-438a-96a7-d69768eba63f.jpg', 6, 2),
            ('adilette-aqua-slides18-55c730d9-50eb-4c5f-bbc5-4f70e4c76a88.jpg', 6, 2),
            ('adilette-aqua-slides20-28af3ffa-74ce-4c46-9539-f554c5a2c4fa.jpg', 6, 1),
            ('adilette-aqua-slides21-66d62b04-6a06-4989-bbe7-90540e6ca912.jpg', 6, 1),
            ('adilette-aqua-slides23-f02b44a1-04f3-47d2-9c4c-164c02253c19.jpg', 6, 1),
            ('adilette-aqua-slides26-9a4e4c48-c796-4ebb-80ab-39e10111888a.jpg', 6, 2);
        `);
  },
  async initColorsTable() {
    await db.query(`
        CREATE TABLE colors (
            color_id bigserial NOT NULL PRIMARY KEY,
            name VARCHAR(10) NOT NULL
        );        
    `);

    await db.query(`
        INSERT INTO colors (name) VALUES ('black'), ('blue'), ('red'), ('yellow');
    `);
  },
  async initFavoritesTable() {
    await db.query(`
        CREATE TABLE favorites (
            favorite_id bigserial NOT NULL PRIMARY KEY,
            product_id bigint REFERENCES products(id),
            user_id bigint REFERENCES users(id),
            color_id bigint REFERENCES colors(id),
            size char(5)
        );
    `);
  },
  async initReviewsTable() {
    await db.query(`
        CREATE TABLE reviews (
            product_id bigint REFERENCES products(id) NOT NULL,
            user_id bigint REFERENCES users(id) NOT NULL,
            review varchar(500) NOT NULL DEFAULT '',
            rating int NOT NULL,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

            PRIMARY KEY(product_id, user_id)
        );
    `);
  },
  async initManufacturersTable() {
    await db.query(`
        CREATE TABLE manufacturers (
            manufacturer_id bigserial NOT NULL PRIMARY KEY,
            name char(50) DEFAULT 'Nike Co.',
            brand_name char(20) DEFAULT 'Nike'
        );
    `);
    await db.query(`
        INSERT INTO manufacturers (name, brand_name)
        VALUES ('Nike Co.', 'Nike'), ('Adidas Co.', 'Adidas');
    `);
  },
  async initStylesTable() {
    await db.query(`
        CREATE TABLE styles (
            style_id bigserial NOT NULL PRIMARY KEY,
            style_name varchar(20)
        );
    `);
    await db.query(`
        INSERT INTO styles (style_name)
        VALUES ('Gym'), ('Sport'), ('Classics'), ('Street');
    `);
  },
  async initOrdersTable() {
    await db.query(`
        CREATE TABLE orders (
            order_id bigserial NOT NULL PRIMARY KEY,
            user_id bigint NOT NULL references users(user_id),
            status varchar(20) DEFAULT 'prepared' CHECK(status = 'prepared' OR status = 'ready' OR status = 'canceled' OR status = 'delivering' OR status = 'delivered' OR status = 'done'),
            address varchar(100) NOT NULL,
            phone varchar(20) NOT NULL,
            receiver varchar(20) NOT NULL,
            email varchar(50),
            est_arrived_date date NOT NULL,
            created_at date DEFAULT CURRENT_DATE,
            total_price FLOAT NOT NULL DEFAULT 0
        );
    `);
  },
  async initOrderItemsTable() {
    await db.query(`
        CREATE TABLE order_items (
            order_item_id bigserial NOT NULL PRIMARY KEY,
            order_id BIGINT REFERENCES orders(order_id),
            product_id BIGINT REFERENCES products(product_id),
            color_id BIGINT REFERENCES colors(color_id),
            quantity INT DEFAULT 1,
            total_price INT DEFAULT 0,
            SIZE char(5)
        );
    `);
  },
  async initStockTable() {
    await db.query(`
        CREATE TABLE stock (
            stock_id bigserial NOT NULL PRIMARY KEY,
            product_id bigint REFERENCES products(product_id),
            size_id bigint REFERENCES sizes(size_id),
            color_id bigint REFERENCES colors(color_id),
            quantity int DEFAULT 0
        )
    `);

    await db.query(`
        INSERT INTO stock (product_id, size_id, color_id, quantity)
        VALUES
            (8	,19	,1 ,20),
            (8	,20	,1 ,30),
            (8	,21	,1 ,40),
            (8	,22	,1 ,50),
            (9,	19	,1 ,20),
            (9	,20	,1 ,2),
            (9	,21	,1 ,20),
            (9	,22	,1 ,20),
            (29	,19	,1 ,2),
            (29	,20	,1 ,1),
            (29	,21	,1 ,0),
            (29	,22	,1 ,20),
            (10	,6	,1 ,20),
            (10	,7	,1 ,0),
            (10	,8	,1 ,20),
            (10	,9	,1 ,20),
            (10	,10	,1 ,20),
            (10	,11	,1 ,20),
            (10	,12	,1 ,200),
            (10	,13	,1 ,1),
            (10	,14	,1 ,20),
            (10	,15	,1 ,50),
            (6	,8	,1 ,20),
            (6	,9	,1, 20),
            (6	,10	,1 ,30),
            (6	,11	,1 ,40),
            (6	,12	,1 ,20),
            (6	,13	,1 ,8),
            (6	,14	,1 ,20),
            (6	,15	,1 ,20),
            (2	,19	,1 ,20),
            (2	,20	,1 ,20),
            (2	,21	,1, 20),
            (2	,22	,1 ,20),
            (2	,23	,1 ,20),
            (3	,1	,1 ,20),
            (3	,3	,1 ,20),
            (3	,6	,1 ,20),
            (3	,7	,1 ,20),
            (3	,9	,1 ,20),
            (3	,11	,1 ,20),
            (3	,13	,1 ,20),
            (3	,15	,1 ,20),
            (1	,1	,1 ,20),
            (1	,3	,1 ,20),
            (1	,6	,1 ,20),
            (1	,7	,1 ,20),
            (1	,9	,1 ,20),
            (1	,11	,1 ,20),
            (1	,13	,1 ,20),
            (1,	15	,1 ,20),
            (5	,18	,1 ,20),
            (5	,19	,1 ,20),
            (5	,20	,1 ,20),
            (5	,21	,1 ,20),
            (5	,22	,1 ,20),
            (5	,23	,1 ,20),
            (7	,19	,1 ,20),
            (7	,20	,1 ,20),
            (7	,21	,1 ,20),
            (7	,22	,1 ,20),
            (7	,23	,1 ,20),
            (11	,6	,1 ,20),
            (11	,7	,1 ,20),
            (11	,8	,1 ,20),
            (11	,9	,1 ,20),
            (11	,10	,1 ,20),
            (11	,11	,1 ,20),
            (11	,12	,1 ,20),
            (11	,13	,1 ,20),
            (11	,14	,1 ,20),
            (11	,15	,1 ,20),
            (26	,18	,1 ,20),
            (26	,19	,1 ,20),
            (26	,20	,1 ,20),
            (26	,21	,1 ,20),
            (26	,22	,1 ,20),
            (26	,23	,1 ,20),
            (29	,19	,1 ,20),
            (29	,20	,1 ,20),
            (29	,21	,1 ,20),
            (29	,22	,1 ,20),
            (30	,5	,1 ,20),
            (30	,7	,1 ,20),
            (30	,9	,1 ,20),
            (30	,11	,1 ,20),
            (30	,13	,1 ,20),
            (30	,15	,1 ,20),
            (30	,17	,1 ,20),
            (14	,4	,1 ,20),
            (14	,5	,1 ,20),
            (14	,6	,1 ,20),
            (14	,7	,1 ,20),
            (14	,8	,1 ,20),
            (14	,9	,1 ,20),
            (14	,10	,1 ,20),
            (14	,11	,1 ,20),
            (14	,12	,1 ,20),
            (14	,13	,1 ,20),
            (14	,14	,1 ,20),
            (14	,15	,1 ,20),
            (14	,16	,1 ,20)
    `);
  },
  async alterTables() {
    await db.query(`
        AlTER TABLE products ADD COLUMN featured BOOLEAN;
        AlTER TABLE products ADD COLUMN manufacturer_id bigint REFERENCES manufacturers(id);

        ALTER TABLE products
        ALTER COLUMN manufacturer_id SET DEFAULT 1;

        ALTER TABLE products
        ADD COLUMN sales int DEFAULT 0,
        ADD COLUMN quantity int NOT NULL DEFAULT 1,
        ADD COLUMN created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;

        ALTER TABLE products
        ADD COLUMN description TEXT DEFAULT E'Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it\'s also lightweight and incredibly versatile whether you\'re jogging after work or hitting the shops.';

        ALTER TABLE products
        ALTER COLUMN description SET DEFAULT '';

        UPDATE products
        SET color_num = 1
        WHERE products.product_id = 5;

        ALTER TABLE images
        DROP COLUMN product_color_id;

        ALTER TABLE images
        ADD COLUMN product_color_id bigint NOT NULL DEFAULT 1 
        CONSTRAINT fk_color_image REFERENCES colors(id);

        ALTER TABLE users
        ADD COLUMN avatar text DEFAULT 'default-avatar.png',
        ADD COLUMN role char(1) DEFAULT '1';

        ALTER TABLE users
        ADD CONSTRAINT users_role_check 
        CHECK(role = '0' OR role = '1');

        ALTER TABLE users
        ALTER COLUMN with_email SET DEFAULT false;

        ALTER TABLE reviews
        ADD COLUMN title VARCHAR(50) DEFAULT '';
    `);
  },
};

/*

-- SELECT * FROM products INNER JOIN styles ON products.style_id = styles.style_id

INSERT INTO reviews (product_id, user_id, review, rating)
VALUES (1, 1, E'Nice design, stylish, fit is true to size. Not much to be said, these are Jordans. If you know you know 😊', 5);

-- SELECT * FROM images 
-- WHERE images.product_id =  (1, 2, 3, 4, 5);

AlTER TABLE products ADD COLUMN featured BOOLEAN;
AlTER TABLE products ADD COLUMN manufacturer_id bigint REFERENCES manufacturers(id);

ALTER TABLE products
ALTER COLUMN manufacturer_id SET DEFAULT 1;

ALTER TABLE products
ADD COLUMN sales int DEFAULT 0,
ADD COLUMN quantity int NOT NULL DEFAULT 1,
ADD COLUMN created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE products
ADD COLUMN description TEXT DEFAULT E'Designed for running but adopted by the streets, the Nike VaporMax 2021 FK gives your attitude an edge. Why? The revolutionary, pillowy Air unit is made for lasting comfort. Plus, the airy Flyknit upper is fun to look at, but it\'s also lightweight and incredibly versatile whether you\'re jogging after work or hitting the shops.';

-- ALTER TABLE product
-- ALTER COLUMN productName TYPE VARCHAR(50),
-- ALTER COLUMN category TYPE VARCHAR(50);

ALTER TABLE products
ALTER COLUMN description SET DEFAULT '';

ALTER TABLE products
ALTER COLUMN id bigserial;

UPDATE products
SET color_num = 1
WHERE products.product_id = 5;

ALTER TABLE images
DROP COLUMN product_color_id;

ALTER TABLE images
ADD COLUMN product_color_id bigint NOT NULL DEFAULT 1 
CONSTRAINT fk_color_image REFERENCES colors(id);

ALTER TABLE users
ADD COLUMN avatar text DEFAULT 'default-avatar.png',
ADD COLUMN role char(1) DEFAULT '1';

ALTER TABLE users
ADD CONSTRAINT users_role_check 
CHECK(role = '0' OR role = '1');

ALTER TABLE users
ALTER COLUMN with_email SET DEFAULT false;

ALTER TABLE reviews
ADD COLUMN title VARCHAR(50) DEFAULT '';


*/
