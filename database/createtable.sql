CREATE DATABASE lap4;
GO
USE lap4;
GO

CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    user_name VARCHAR(25) NOT NULL,
    user_email VARCHAR(55) NOT NULL,
    user_pass VARCHAR(255) NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    product_price FLOAT NOT NULL,
    product_description TEXT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE()
);


CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE order_details (
    order_detail_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    updated_at DATETIME DEFAULT GETDATE(),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

