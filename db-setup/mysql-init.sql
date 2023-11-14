    CREATE SCHEMA order_schema;
    CREATE SCHEMA identity_schema;
    CREATE SCHEMA catalog_schema;

    USE order_schema;
    CREATE TABLE orders (
      id INT NOT NULL AUTO_INCREMENT,
      customer_id INT NOT NULL,
      customer_email VARCHAR(255) NOT NULL,
      product_id INT NOT NULL,
      sold_price DECIMAL(10,2) NOT NULL,
      created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (id)
    );

    USE identity_schema;
    CREATE TABLE users (
      id INT NOT NULL AUTO_INCREMENT,
      username VARCHAR(255) NOT NULL,
      password VARCHAR(255) NOT NULL,
      email VARCHAR(255) NOT NULL,
      created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (id)
    );

    USE catalog_schema;
    CREATE TABLE product_catalog (
        productid INT PRIMARY KEY,
        seller_id INT NOT NULL,
        product_name VARCHAR(255) NOT NULL,
        category VARCHAR(100),
        price DECIMAL(10, 2) NOT NULL,
        description TEXT,
        availability BOOLEAN NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE shops (
      seller_id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL,
      description TEXT,
      email VARCHAR(255) NOT NULL,
      PRIMARY KEY (id)
    );

    -- Inserting sample sellers into the shops table and obtaining the seller_id values
    INSERT INTO shops (name, description, email) VALUES 
    ('Pottery Store', 'Local pottery shop', 'potterystore@example.com'),
    ('Arts & Crafts Emporium', 'Art supplies and crafts', 'artsandcrafts@example.com');

    -- Inserting products for a pottery shop (seller_id: 1)
    INSERT INTO product_catalog (productid, product_name, category, price, description, availability, seller_id) VALUES 
    (1, 'Clay Vase', 'Pottery', 25.99, 'Handcrafted clay vase', true, 1),
    (2, 'Ceramic Bowl Set', 'Pottery', 39.50, 'Set of 4 ceramic bowls', true, 1),
    (3, 'Decorative Pot', 'Pottery', 19.99, 'Decorative glazed pot', true, 1);

    -- Inserting products for an arts and crafts business (seller_id: 2)
    INSERT INTO product_catalog (productid, product_name, category, price, description, availability, seller_id) VALUES 
    (4, 'Oil Paint Set', 'Art Supplies', 49.99, 'Professional oil paint set', true, 2),
    (5, 'Canvas Pack', 'Art Supplies', 29.50, 'Pack of 5 artist canvases', true, 2),
    (6, 'Calligraphy Pen Set', 'Art Supplies', 15.99, 'Set of calligraphy pens', true, 2);


    CREATE USER 'order_user'@'%' IDENTIFIED BY 'order_password';
    GRANT ALL ON order_schema.* TO 'order_user';

    CREATE USER 'identity_user'@'%' IDENTIFIED BY 'identity_password';
    GRANT ALL ON identity_schema.* TO 'identity_user';

    CREATE USER 'catalog_write_user'@'%' IDENTIFIED BY 'catalog_password';
    GRANT ALL ON catalog_schema.* TO 'catalog_write_user';

    CREATE USER 'catalog_read_user'@'%' IDENTIFIED BY 'catalog_password';
    GRANT SELECT ON catalog_schema.* TO 'catalog_read_user';
