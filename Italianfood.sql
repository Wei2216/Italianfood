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


