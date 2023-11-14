    CREATE SCHEMA order_schema;
    CREATE SCHEMA identity_schema;
    CREATE SCHEMA catalog_schema;

    USE order_schema;
    CREATE TABLE orders (
      id INT NOT NULL AUTO_INCREMENT,
      customer_id INT NOT NULL,
      total_price DECIMAL(10,2) NOT NULL,
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
    CREATE TABLE products (
      id INT NOT NULL AUTO_INCREMENT,
      name VARCHAR(255) NOT NULL,
      description TEXT,
      price DECIMAL(10,2) NOT NULL,
      created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (id)
    );

    CREATE USER 'order_user'@'%' IDENTIFIED BY 'order_password';
    GRANT ALL ON order_schema.* TO 'order_user';

    CREATE USER 'identity_user'@'%' IDENTIFIED BY 'identity_password';
    GRANT ALL ON identity_schema.* TO 'identity_user';

    CREATE USER 'catalog_write_user'@'%' IDENTIFIED BY 'catalog_password';
    GRANT ALL ON catalog_schema.* TO 'catalog_write_user';

    CREATE USER 'catalog_read_user'@'%' IDENTIFIED BY 'catalog_password';
    GRANT SELECT ON catalog_schema.* TO 'catalog_read_user';
