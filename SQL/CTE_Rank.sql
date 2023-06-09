 WITH ranking AS (
    SELECT *, RANK() OVER(PARTITION BY customer_id ORDER BY start_date DESC)
    FROM subscriptions
    WHERE start_date <= '2020-12-31'
 )
 SELECT plan_name, count(plan_id) AS customer_count,
    ROUND(
          COUNT(plan_id)::NUMERIC/(SELECT COUNT(customer_id) from ranking 
          where rank = 1) * 100
    , 1) AS percentage
 FROM ranking
 JOIN plans
 USING(plan_id)
 WHERE rank = 1
 GROUP BY plan_name
 ORDER BY customer_count DESC;