DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id serial PRIMARY KEY,
    username varchar(64),
    email varchar(100) UNIQUE,
    passwrd varchar(10000),
    rating float,
    rating_num int,
    location varchar(7),
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
  location varchar(7),
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
 
INSERT INTO category(category_name) VALUES ('Meat');
INSERT INTO category(category_name) VALUES ('Veg');
INSERT INTO category(category_name) VALUES ('Fruit');
INSERT INTO users(username, email, passwrd, rating, rating_num, location, radius) VALUES ('zahra', 'zahra@email.co.uk', 'pass123', 5.0, 10, 'SE18', 2);
INSERT INTO products(user_id, category_id, is_retail, location, price, expiry, description, image) VALUES (1, 2, True, 'SE18', 2.99, '03/04/2022', 'Tomatoes', 'LINK');
INSERT INTO productratings(product_id, user_id, rating) VALUES (1, 1, 1);

INSERT INTO users(username, email, passwrd, rating, rating_num, location, radius) VALUES ('test2', 'test2@email.co.uk', 'pass123', 0, 0, 'SE18', 2);
INSERT INTO users(username, email, passwrd, rating, rating_num, location, radius) VALUES ('test3', 'test3@email.co.uk', 'pass123', 0, 0, 'SE18', 2);

INSERT INTO products(user_id, category_id, is_retail, location, price, expiry, description, image) VALUES (3, 2, True, 'SE18', 2.99, '03/04/2022', 'Broccoli', 'LINK');
INSERT INTO products(user_id, category_id, is_retail, location, price, expiry, description, image) VALUES (3, 2, True, 'SE18', 2.99, '03/04/2022', 'Onion', 'LINK');
