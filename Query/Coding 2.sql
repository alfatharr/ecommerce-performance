WITH monthly_active_cus AS (
	SELECT
		year,
		round(AVG(monthly_active_customers),0) AS avg_monthly_active_customers
	FROM(
		SELECT
			EXTRACT(YEAR FROM ord.order_purchase_timestamp) AS year,
			EXTRACT(MONTH FROM ord.order_purchase_timestamp) AS month,
			COUNT(DISTINCT cus.customer_unique_id) AS monthly_active_customers
		FROM orders ord
		INNER JOIN customers cus on ord.customer_id = cus.customer_id
		GROUP BY year, month
		) i
	GROUP BY year),
new_customers_per_year AS (
	SELECT 
		EXTRACT(YEAR FROM first_order_date) AS year, 
		COUNT(j.customer_unique_id) as new_customers 
	FROM(
		SELECT
			cus.customer_unique_id,
			MIN(ord.order_purchase_timestamp) as first_order_date
	  FROM orders ord 
	  INNER JOIN customers cus on cus.customer_id = ord.customer_id
	  GROUP BY cus.customer_unique_id
		) j
	GROUP BY year
	ORDER BY year),
repeat_customer_per_year AS(
	SELECT
		year, 
		COUNT(total_customer) AS repeat_order
	FROM (
		SELECT 
			EXTRACT(YEAR FROM ord.order_purchase_timestamp) AS year,
   			cus.customer_unique_id,
   			COUNT(cus.customer_unique_id) AS total_customer,
   			COUNT(ord.order_id) AS total_order
		FROM orders ord
		JOIN customers cus ON ord.customer_id = cus.customer_id
		GROUP BY year, cus.customer_unique_id
		HAVING COUNT(order_id) >1
		) k
	GROUP BY 1
	ORDER BY 1),
avg_order_per_cus AS(
	SELECT
		year,
		round(AVG(total), 2) AS avg_order_per_customer
	FROM(
	SELECT
		cus.customer_unique_id,
		EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
		COUNT (*) AS total
	FROM orders o
	INNER JOIN customers cus ON o.customer_id = cus.customer_id
	GROUP BY cus.customer_unique_id, year
	) f
	GROUP BY year)
SELECT
mac.year,
mac.avg_monthly_active_customers,
nc.new_customers,
cro.repeat_order,
aop.avg_order_per_customer
FROM monthly_active_cus mac
JOIN new_customers_per_year nc ON mac.year=nc.year
JOIN repeat_customer_per_year cro ON mac.year=cro.year
JOIN avg_order_per_cus aop ON mac.year=aop.year;