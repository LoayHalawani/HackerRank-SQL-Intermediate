SELECT CU.customer_name, FORMAT(SUM(IV.total_price), 6) AS amount_spent
FROM customer AS CU
INNER JOIN invoice AS IV ON CU.id = IV.customer_id
GROUP BY CU.customer_name
HAVING SUM(IV.total_price) < 0.25 * (SELECT AVG(total_price) FROM invoice)
ORDER BY amount_spent DESC;
