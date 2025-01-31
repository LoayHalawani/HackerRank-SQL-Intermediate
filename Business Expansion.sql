SELECT CO.user_account_id, UA.first_name, UA.last_name, CO.customer_id, CU.customer_name, COUNT(CO.id) AS num_of_contacts
FROM contact AS CO
INNER JOIN user_account AS UA ON CO.user_account_id = UA.id
INNER JOIN customer AS CU ON CO.customer_id = CU.id
GROUP BY CO.user_account_id, UA.first_name, UA.last_name, CO.customer_id, CU.customer_name
HAVING COUNT(CO.id) > 1
ORDER BY CO.user_account_id ASC;
