--Crie uma lista com o nome da empresa e uma nova coluna chamada 'Categoria'. Se o plano custar mais que 100, chame de 'Plano Premium', senão, 'Plano Standard'

SELECT c.company_name,
	CASE 
		WHEN pl.monthly_price >= 100 THEN 'Plano Premium'
		ELSE 'Plano Standard'
	END AS Categoria
FROM customers c
JOIN subscriptions s 
	ON c.customer_id = s.customer_id 
	AND s.status IN ('active', 'past_due') --Apesar de não pedir no enuciado, fiz essa filtragem para ter um resultado mais preciso para analise de dados
JOIN plans pl 
	ON s.plan_id = pl.plan_id;
