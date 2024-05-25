CREATE TABLE total_canceled_order_per_year AS
	SELECT
		EXTRACT (YEAR FROM order_purchase_timestamp) AS year,
		COUNT (order_id) AS total_canceled_order
	FROM orders
	WHERE order_status = 'canceled'
	GROUP BY year
	ORDER BY year;

	