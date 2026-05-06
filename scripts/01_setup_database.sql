CREATE TABLE plans (
    plan_id SERIAL PRIMARY KEY,
    plan_name VARCHAR(50) NOT NULL,
    monthly_price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(50),
    signup_date DATE NOT NULL
);

CREATE TABLE subscriptions (
    subscription_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    plan_id INT REFERENCES plans(plan_id),
    start_date DATE NOT NULL,
    end_date DATE, -- NULL se estiver ativo
    status VARCHAR(20) CHECK (status IN ('active', 'canceled', 'past_due'))
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    subscription_id INT REFERENCES subscriptions(subscription_id),
    payment_date DATE NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    payment_status VARCHAR(20) CHECK (payment_status IN ('completed', 'failed'))
);

INSERT INTO plans (plan_name, monthly_price) VALUES 
('Basic', 49.00), 
('Pro', 99.00), 
('Enterprise', 249.00);

INSERT INTO customers (company_name, industry, signup_date) VALUES 
('TechNova', 'Software', '2023-01-01'),
('FinServe', 'Finance', '2023-02-15'),
('HealthPlus', 'Health', '2023-03-10'),
('EduSmart', 'Education', '2023-04-05'),
('GreenEnergy', 'Energy', '2023-05-20'),
('CloudScale', 'Software', '2023-06-12');

INSERT INTO subscriptions (customer_id, plan_id, start_date, end_date, status) VALUES 
(1, 2, '2023-01-01', NULL, 'active'),       
(2, 3, '2023-02-15', '2023-05-15', 'canceled'), 
(3, 1, '2023-03-10', NULL, 'active'),       
(4, 2, '2023-04-05', NULL, 'past_due'),       -- Com pagamento atrasado
(5, 3, '2023-05-20', NULL, 'active'),         
(6, 1, '2023-06-12', '2023-07-12', 'canceled');

INSERT INTO payments (subscription_id, payment_date, amount, payment_status) VALUES 
(1, '2023-01-01', 99.00, 'completed'),
(1, '2023-02-01', 99.00, 'completed'),
(2, '2023-02-15', 249.00, 'completed'),
(2, '2023-03-15', 249.00, 'completed'),
(2, '2023-04-15', 249.00, 'failed'),      -- Falha que levou ao cancelamento
(4, '2023-04-05', 99.00, 'completed'),
(4, '2023-05-05', 99.00, 'failed');       -- Gerou o status past_due
