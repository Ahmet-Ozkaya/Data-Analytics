--SELECT JOIN IN
SELECT s.customer_id, p.plan_id, p.plan_name, s.start_date
FROM plans AS p
JOIN subscriptions AS s
ON p.plan_id = s.plan_id
WHERE s.customer_id IN (1,2,11,13,15,16,18,19);