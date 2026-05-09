--Quantos dias cada empresa que saiu do SaaS permaneceu como cliente

SELECT C.company_name, S.start_date, S.end_date, end_date - start_date AS tenure
FROM subscriptions S
JOIN customers C
	ON C.customer_id = S.customer_id
WHERE end_date IS NOT NULL
ORDER BY tenure
