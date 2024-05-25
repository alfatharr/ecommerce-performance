SELECT 
	payment_type,
	COUNT(payment_type) AS total_used
FROM payment
GROUP BY payment_type
ORDER BY COUNT(payment_type) DESC