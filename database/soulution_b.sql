USE lap4;

-- 1️ Liệt kê các hóa đơn của khách hàng (mã user, tên user, mã hóa đơn)
SELECT o.user_id, u.user_name, o.order_id
FROM orders o
JOIN users u ON o.user_id = u.user_id;

-- 2️ Liệt kê số lượng đơn hàng của mỗi khách hàng
SELECT u.user_id, u.user_name, COUNT(o.order_id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name;

-- 3️ Liệt kê số sản phẩm trong mỗi đơn hàng
SELECT o.order_id, COUNT(od.product_id) AS total_products
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id;

-- 4️ Liệt kê thông tin mua hàng của người dùng (gom nhóm theo đơn hàng)
SELECT o.user_id, u.user_name, o.order_id, STRING_AGG(p.product_name, ', ') AS products
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.user_id, u.user_name, o.order_id
ORDER BY o.order_id;

-- 5️ Liệt kê 7 khách hàng có số lượng đơn hàng nhiều nhất
SELECT TOP 7 u.user_id, u.user_name, COUNT(o.order_id) AS total_orders
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.user_name
ORDER BY total_orders DESC;

-- 6️ Liệt kê 7 khách hàng mua sản phẩm có "Samsung" hoặc "Apple"
SELECT TOP 7 u.user_id, u.user_name, o.order_id, p.product_name
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
WHERE p.product_name LIKE '%Samsung%' OR p.product_name LIKE '%Apple%';

-- 7️ Liệt kê danh sách mua hàng kèm tổng tiền mỗi đơn hàng
SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS total_price
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY o.user_id, u.user_name, o.order_id;

-- 8️ Lấy đơn hàng có tổng tiền lớn nhất của mỗi user
WITH OrderTotals AS (
    SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS total_price,
           RANK() OVER (PARTITION BY o.user_id ORDER BY SUM(p.product_price) DESC) AS rank_order
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, total_price
FROM OrderTotals
WHERE rank_order = 1;

-- 9️ Lấy đơn hàng có tổng tiền nhỏ nhất của mỗi user
WITH OrderTotals AS (
    SELECT o.user_id, u.user_name, o.order_id, SUM(p.product_price) AS total_price,
           RANK() OVER (PARTITION BY o.user_id ORDER BY SUM(p.product_price) ASC) AS rank_order
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    JOIN products p ON od.product_id = p.product_id
    GROUP BY o.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, total_price
FROM OrderTotals
WHERE rank_order = 1;

-- 10 Lấy đơn hàng có số sản phẩm nhiều nhất của mỗi user
WITH OrderCounts AS (
    SELECT o.user_id, u.user_name, o.order_id, COUNT(od.product_id) AS total_products,
           RANK() OVER (PARTITION BY o.user_id ORDER BY COUNT(od.product_id) DESC) AS rank_order
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.user_id, u.user_name, o.order_id
)
SELECT user_id, user_name, order_id, total_products
FROM OrderCounts
WHERE rank_order = 1;
