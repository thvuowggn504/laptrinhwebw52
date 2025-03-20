USE lap4;

-- 1. Lấy danh sách người dùng theo Alphabet
SELECT * FROM users ORDER BY user_name ASC;

-- 2. Lấy 7 người dùng theo Alphabet
SELECT TOP 7 * FROM users ORDER BY user_name ASC;

-- 3. Lấy người dùng có chữ 'a' trong tên
SELECT * FROM users WHERE user_name LIKE '%a%' ORDER BY user_name ASC;

-- 4. Lấy người dùng có tên bắt đầu bằng 'm'
SELECT * FROM users WHERE user_name LIKE 'm%' ORDER BY user_name ASC;

-- 5. Lấy người dùng có tên kết thúc bằng 'i'
SELECT * FROM users WHERE user_name LIKE '%i' ORDER BY user_name ASC;

-- 6. Lấy người dùng có email là Gmail
SELECT * FROM users WHERE user_email LIKE '%@gmail.com';

-- 7. Lấy Gmail users có tên bắt đầu bằng 'm'
SELECT * FROM users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE 'm%';

-- 8. Lấy Gmail users có chữ 'i' trong tên, chiều dài > 5
SELECT * FROM users WHERE user_email LIKE '%@gmail.com' AND user_name LIKE '%i%' AND LEN(user_name) > 5;

-- 9. Lấy users có 'a' (5-9 ký tự) & Gmail có chữ 'i' trong email
SELECT * FROM users 
WHERE user_name LIKE '%a%' AND LEN(user_name) BETWEEN 5 AND 9 
AND user_email LIKE '%@gmail.com%' AND user_email LIKE '%i%';

-- 10. Lấy users có 'a' (5-9 ký tự) hoặc 'i' (<9 ký tự) hoặc Gmail có chữ 'i'
SELECT * FROM users 
WHERE (user_name LIKE '%a%' AND LEN(user_name) BETWEEN 5 AND 9)
OR (user_name LIKE '%i%' AND LEN(user_name) < 9)
OR (user_email LIKE '%@gmail.com%' AND user_email LIKE '%i%');



