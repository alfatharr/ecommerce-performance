SELECT
	payment_type,
	COUNT(CASE WHEN EXTRACT(YEAR FROM o.order_purchase_timestamp) =2016 THEN 1 END) AS total_used_in_2016,
	COUNT(CASE WHEN EXTRACT(YEAR FROM o.order_purchase_timestamp) =2017 THEN 1 END) AS total_used_in_2017,
	COUNT(CASE WHEN EXTRACT(YEAR FROM o.order_purchase_timestamp) =2018 THEN 1 END) AS total_used_in_2018,
	CASE 
		WHEN COUNT(p.payment_type) >= 30000 THEN 'highly_popular' 
		WHEN COUNT(p.payment_type) >= 15000 AND COUNT(p.payment_type) <30000 THEN 'moderately_popular' 
		WHEN COUNT(p.payment_type) <15000 THEN 'less_popular' 
		END popularity_category
FROM orders o
JOIN payment p on o.order_id = p.order_id
GROUP BY payment_type