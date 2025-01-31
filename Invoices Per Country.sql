SELECT CO.country_name, COUNT(IV.id) AS num_of_invoices, ROUND(AVG(IV.total_price), 6)
FROM country as CO
INNER JOIN city AS CI ON CO.id = CI.country_id
INNER JOIN customer AS CU ON CI.id = CU.city_id
INNER JOIN invoice as IV ON CU.id = IV.customer_id
GROUP BY CO.country_name
HAVING AVG(IV.total_price) > (SELECT AVG(total_price) FROM invoice);
