USE lap4
GO

INSERT INTO users (user_name, user_email, user_pass)
VALUES 
('Nguyen Van A', 'nguyenvana@gmail.com', '123456'),
('Tran Thi B', 'tranb@yahoo.com', 'abcdef'),
('Le Van C', 'levanc@gmail.com', 'qwerty');

INSERT INTO products (product_name, product_price, product_description)
VALUES 
('Laptop Dell', 1500, 'Laptop hiệu Dell cao cấp'),
('iPhone 13', 999, 'Điện thoại Apple iPhone 13'),
('Samsung Galaxy S22', 899, 'Điện thoại Samsung mới nhất');

INSERT INTO orders (user_id)
VALUES 
(1),
(2),
(3);

INSERT INTO order_details (order_id, product_id)
VALUES 
(1, 2),
(1, 3),
(2, 1);
