--Quais empresas tiveram pagamentos falhos e qual o prejuízo total acumulado por cada uma?


SELECT company_name, SUM(amount)
FROM customers c
JOIN subscriptions s
	ON c.customer_id = s.customer_id
JOIN payments p
	ON p.subscription_id = s.subscription_id
WHERE payment_status = 'failed'
GROUP BY company_name
