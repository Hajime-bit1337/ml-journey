-- 1. Заказы 2026 года отсортированные по дате
-- Не могу предсказать ответа
SELECT customer_id, order_date FROM orders WHERE order_date LIKE '2026%' ORDER BY order_date;

-- 2. Клиенты зарегистрировавшиеся до 2025
-- На выходе ождиаю 3 строки
SELECT name, signup_date FROM customers WHERE signup_date BETWEEN '2000-01-01' AND '2024-12-31';

-- 3. Сколько клиентов в каждом городе, включая тех у кого город неизвестен
-- Ожидаю 6 строк
SELECT city, COUNT(*) FROM customers GROUP BY city;

-- 4. Число заказов и общая сумма по каждому клиенту, с именем клиента
-- Ожидаю 8 строк у клиента 999 имя - NULL
SELECT c.name, c.id, COUNT(o.customer_id), ROUND(SUM(o.amount), 2) FROM customers AS c LEFT JOIN orders AS o ON c.id = o.customer_id GROUP BY c.id;

-- 5. Клиенты у которых средний чек выше среднего чека по всей базе
-- Не могу предсказать ответа
SELECT customer_id, ROUND(AVG(amount), 3) AS mean FROM orders GROUP BY customer_id HAVING mean > (SELECT ROUND(AVG(amount), 3) FROM orders);

-- 6. Клиенты вообще без заказов
-- Ожидаю одну строку
SELECT c.id, c.name FROM customers AS c LEFT JOIN orders AS o ON c.id = o.customer_id WHERE o.customer_id IS NULL;

-- 7. Месяц с наибольшей выручкой
-- Ожидаю одну строку
SELECT strftime('%Y-%m', order_date) AS month, ROUND(SUM(amount), 2) AS total FROM orders GROUP BY month ORDER BY total DESC LIMIT 1;

-- 8. Каждый заказ и его доля в общей сумме трат этого клиента в процентах
-- Ожидаю 40 строк
SELECT id, ROUND(amount, 2), ROUND(amount / SUM(amount) OVER (PARTITION BY customer_id) * 100, 2) AS percent FROM orders;

-- 9. Два самых дорогих заказа каждого человека
-- Ожидаю 15 строк (7 * 2 + 1(999))
WITH ranked AS (SELECT customer_id, id, amount, ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS rn FROM orders) SELECT customer_id, id, amount, rn FROM ranked WHERE rn <= 2 ORDER BY customer_id;

-- 10. Накопительная сумма трат клиента по датам: рядом с каждым заказом — сколько он потратил суммарно к этому моменту
-- Ожидаю 40 строк
SELECT customer_id, ROUND(SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date), 2) FROM ORDERS ORDER BY customer_id;

-- 11. Список городов с самой большой выручкой в порядке убывания
-- Ожидаю 6 строк
SELECT c.city, ROUND(SUM(o.amount), 2) AS total FROM customers AS c LEFT JOIN orders AS o ON c.id = o.customer_id GROUP BY city ORDER BY total DESC;

-- 12. 6 Людей с самыми бедными заказами
-- Ожидаю 6 строк
SELECT c.name, o.customer_id, ROUND(SUM(o.amount), 2) AS total FROM customers AS c LEFT JOIN orders AS o ON c.id = o.customer_id WHERE o.customer_id IS NOT NULL GROUP BY o.customer_id ORDER BY total LIMIT 6;