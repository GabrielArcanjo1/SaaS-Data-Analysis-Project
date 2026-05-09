--No total, somando todos os planos ativos, quanto o SaaS fatura por mês?

SELECT SUM(monthly_price) MMR
FROM subscriptions s
JOIN plans pl
	ON pl.plan_id = s.plan_id
WHERE s.status IN ('active', 'past_due')
