SELECT CI.city_name, PR.product_name, ROUND(SUM(II.line_total_price), 2) AS total_amount
FROM city AS CI
INNER JOIN customer AS CU ON CI.id = CU.city_id
INNER JOIN invoice AS IV ON CU.id = IV.customer_id
INNER JOIN invoice_item AS II ON IV.id = II.invoice_id
INNER JOIN product AS PR ON II.product_id = PR.id
GROUP BY CI.city_name, PR.product_name
ORDER BY total_amount DESC, CI.city_name ASC, PR.product_name ASC;
