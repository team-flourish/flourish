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
  category_name varchar(100)
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
  date_time DATE DEFAULT CURRENT_TIMESTAMP,
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
 
INSERT INTO category(category_name) VALUES ('Bakery');
INSERT INTO category(category_name) VALUES ('Dairy');
INSERT INTO category(category_name) VALUES ('Eggs');
INSERT INTO category(category_name) VALUES ('Fish');
INSERT INTO category(category_name) VALUES ('Fruit');
INSERT INTO category(category_name) VALUES ('Meat');
INSERT INTO category(category_name) VALUES ('Vegtables');
INSERT INTO category(category_name) VALUES ('Other');

INSERT INTO users(username, email, passwrd, rating, longitude, latitude, radius) VALUES ('test', 'test@email.co.uk', 'password123', 5.0, 51.5014, 0.1419, 2);
