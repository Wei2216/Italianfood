-- PostgreSQL版本的資料庫結構與初始資料

CREATE TABLE member (
  ID SERIAL PRIMARY KEY,
  "Username" VARCHAR(32) NOT NULL,
  "Password" VARCHAR(255) NOT NULL,
  "Email" VARCHAR(32) NOT NULL,
  "Created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO member ("ID", "Username", "Password", "Email", "Created_at") VALUES
(9, '111', '$2y$10$GqIMc1LGmC5OyO41RosYSeYmdUg.ecGEWu/palpk3ZvYMA8p9jCdi', '111111', '2024-12-30 08:12:04'),
(10, '222', '$2y$10$j0c/jcab5PCjQp7Ffcrpa.sHK1Aaht/sW3Dk78b8PQRYaxkKi9jlq', '222222', '2024-12-30 08:12:16'),
(11, '444', '$2y$10$Ke0Hu6B5tGt/xESTkpgpEeMIdjnicy7BOLoNaZ7TZQP3l3V1hgOs.', '44444444', '2025-01-02 15:47:44');

CREATE TABLE product (
  ID SERIAL PRIMARY KEY,
  "Product" VARCHAR(32) NOT NULL,
  "Price" INT NOT NULL,
  "Ice" VARCHAR(32) NOT NULL,
  "Created_at" TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO product ("ID", "Product", "Price", "Ice", "Created_at") VALUES
(51, '咖啡紅茶', 40, '1/3冰', '2024-10-21 07:56:54'),
(89, '紅茶拿鐵', 50, '全冰', '2024-11-11 00:38:29'),
(91, '珍珠奶茶', 20, '1/2冰', '2024-11-11 05:47:07'),
(93, '珍珠奶茶', 40, '去冰', '2024-11-11 06:21:04'),
(96, '咖啡紅茶', 50, '1/2冰', '2024-11-11 07:38:14'),
(97, '紅茶拿鐵', 90, '全冰', '2024-11-11 07:38:34'),
(102, '珍珠奶茶', 90, '全冰', '2024-11-11 07:49:40'),
(106, '珍珠紅茶', 50, '1/3冰', '2024-11-11 08:00:22'),
(107, '珍珠奶茶', 50, '1/3冰', '2024-11-11 08:00:41');
