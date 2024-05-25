CREATE TABLE total_revenue_per_year AS
	SELECT 
		EXTRACT (YEAR FROM order_purchase_timestamp) AS year,
		SUM (company_revenue) AS total_revenue
	FROM (
		SELECT 
			order_id,
			SUM (price + fright_value) AS company_revenue
		FROM items
		GROUP BY order_id
	) revenue
	JOIN orders o ON revenue.order_id = o.order_id
	WHERE order_status = 'delivered'
	GROUP BY year
	ORDER BY year;