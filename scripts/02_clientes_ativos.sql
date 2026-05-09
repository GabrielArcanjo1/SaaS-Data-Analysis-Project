--Quais empresas são nossos clientes ativos hoje e qual o valor mensal que cada uma paga?

SELECT C.company_name, C.industry, P.plan_name, S.Status
FROM subscriptions S
INNER JOIN plans P
	ON  P.plan_id = S.plan_id
INNER JOIN Customers C
		ON C.customer_id = S.customer_id
WHERE S.status = 'active'
ORDER BY C.company_name
