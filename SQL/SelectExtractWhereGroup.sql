SELECT EXTRACT(MONTH FROM start_date) AS month_no, 
  UPPER(TO_CHAR(start_date, 'month')) AS month_name,
  COUNT(customer_id) AS customer_count 
 FROM subscriptions 
 WHERE plan_id = (SELECT plan_id FROM plans WHERE plan_name = 'trial' )
 GROUP BY month_name, month_no
 ORDER BY customer_count DESC;