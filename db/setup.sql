DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id serial PRIMARY KEY,
    username varchar(64),
    email varchar(100) UNIQUE,
    passwrd varchar(10000),
    rating float,
    longitude float,
    latitude float,
    radius float
);

DROP TABLE IF EXISTS category;
CREATE TABLE category (
  category_id serial PRIMARY KEY,
  category_name varchar(100),
  color varchar(7)
);

DROP TABLE IF EXISTS products;
CREATE TABLE products (
  product_id serial PRIMARY KEY,
  description varchar(100),
  image varchar(500),
  is_retail boolean NOT NULL,
  longitude float,
  latitude float,
  price float,
  expiry varchar(15),
  date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  user_id INT,
  FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
  category_id INT,
  FOREIGN KEY(category_id)
        REFERENCES category(category_id)
        ON DELETE SET NULL
);

DROP TABLE IF EXISTS productratings;
CREATE TABLE productRatings (
  product_rating_id serial PRIMARY KEY,
  product_id INT,
  FOREIGN KEY(product_id)
        REFERENCES products(product_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
  user_id INT,
  FOREIGN KEY(user_id)
        REFERENCES users(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
  rating INT
);
 
INSERT INTO category(category_name, color) VALUES ('Bakery', '#E3914A');
INSERT INTO category(category_name, color) VALUES ('Dairy', '#CBBC95');
INSERT INTO category(category_name, color) VALUES ('Eggs', '#FFBC0F');
INSERT INTO category(category_name, color) VALUES ('Fish', '#2AD0D0');
INSERT INTO category(category_name, color) VALUES ('Fruit', '#D02A66');
INSERT INTO category(category_name, color) VALUES ('Meat', '#FF3E3E');
INSERT INTO category(category_name, color) VALUES ('Vegtables', '#37D02A');
INSERT INTO category(category_name, color) VALUES ('Other', '#808080');

INSERT INTO users(username, email, passwrd, rating, longitude, latitude, radius) VALUES ('test', 'test@email.co.uk', 'password123', 5.0, 51.5014, 0.1419, 2);
