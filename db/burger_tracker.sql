DROP TABLE IF EXISTS deals;
DROP TABLE IF EXISTS burgers;
DROP TABLE IF EXISTS eateries;

CREATE TABLE eateries(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  tel_no VARCHAR(255),
  motto VARCHAR(255),
  logo VARCHAR(255)
);

CREATE TABLE burgers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  price FLOAT(2),
  image VARCHAR(255)
);

CREATE TABLE deals(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  discount FLOAT(2),
  day VARCHAR(255),
  eatery_id INT4 REFERENCES eateries(id) ON DELETE CASCADE,
  burger_id INT4 REFERENCES burgers(id) ON DELETE CASCADE
);
