SELECT
	tr.year,
	tr.total_revenue AS total_revenue_per_year,
	tco.total_canceled_order AS canceled_order_per_year,
	hr.product_category_name,
	hr.revenue AS total_revenue,
	hc.product_category_name,
	hc.canceled_order AS total_canceled_order
FROM total_revenue_per_year tr
JOIN total_canceled_order_per_year tco ON tr.year = tco.year
JOIN highest_revenue_by_product_cat hr ON tr.year = hr.year
JOIN highest_canceled_order_by_product_cat hc ON tr.year = hc.year