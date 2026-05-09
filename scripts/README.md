02_clientes_ativos.sql - Identificação de clientes com contratos vigentes, colocando em pratica o uso de JOINs junção de tabelas e extração de dados .

03_clientes_churn.sql - Esta análise foca em clientes que cancelaram (Churn), e o calculo da diferença de dias entre a data de adesão e a data de cancelamento para pegar o tempo médio de permanência

04_ranking_prejuizo.sql - Perdas financeiras por inadimplência. Este script utiliza funções de agregação (SUM) e agrupamento (GROUP BY) para consolidar o valor total de pagamentos falhos por cliente

05_faturamento_mrr.sql – Cálculo do Monthly Recurring Revenue (MRR). Este script consolida a receita mensal prevista através da soma dos preços dos planos vinculados a assinaturas ativas ou em atraso (past_due).

06_segmentacao_clientes.sql – Classificação de clientes por faixa de faturamento. Utilizo a estrutura condicional CASE WHEN para categorizar as empresas entre 'Premium' e 'Standard' com base no valor dos planos contratados, permitindo análises segmentadas de Marketing e Customer Success.
