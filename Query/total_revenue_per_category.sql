CREATE TABLE highest_revenue_by_product_cat AS
	SELECT
		year,
		product_category_name,
		revenue
	FROM (
		SELECT
			EXTRACT (YEAR FROM order_purchase_timestamp) AS year,
			product_category_name,
			SUM (i.price + i.fright_value) AS revenue,
			RANK () OVER(
				PARTITION BY EXTRACT (YEAR FROM o.order_purchase_timestamp)
				ORDER BY SUM (i.price + i.fright_value) DESC) AS total_revenue
		FROM items i
		JOIN orders o ON o.order_id = i.order_id
		JOIN product p ON p.product_id = i.product_id
		WHERE o.order_status = 'delivered'
		GROUP BY year, product_category_name
	) f
	WHERE total_revenue = 1;