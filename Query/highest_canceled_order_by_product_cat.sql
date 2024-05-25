CREATE TABLE highest_canceled_order_by_product_cat AS
	SELECT
		year,
		product_category_name,
		canceled_order
	FROM (
		SELECT
			EXTRACT (YEAR FROM order_purchase_timestamp) AS year,
			product_category_name,
			COUNT (o.order_id) AS canceled_order,
			RANK () OVER(
				PARTITION BY EXTRACT (YEAR FROM o.order_purchase_timestamp)
				ORDER BY COUNT (o.order_id) DESC) AS total_canceled_order
		FROM items i
		JOIN orders o ON o.order_id = i.order_id
		JOIN product p ON p.product_id = i.product_id
		WHERE o.order_status = 'canceled'
		GROUP BY year, product_category_name
	) f
	WHERE total_canceled_order = 1;