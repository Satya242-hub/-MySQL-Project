-- Total records
SELECT COUNT(*) FROM ecommerce_events;

-- Event distribution
SELECT event_type, COUNT(*) 
FROM ecommerce_events 
GROUP BY event_type;

-- Price analysis
SELECT MIN(price), MAX(price), AVG(price)
FROM ecommerce_events;

-- Top viewed products
SELECT product_id, COUNT(*) AS views
FROM ecommerce_events
WHERE event_type = 'view'
GROUP BY product_id
ORDER BY views DESC
LIMIT 5;


-- Conversion rate (purchase vs views)
SELECT 
    COUNT(*) AS total_events,
    SUM(event_type = 'view') AS total_views,
    SUM(event_type = 'purchase') AS total_purchases,
    (SUM(event_type = 'purchase') / SUM(event_type = 'view')) * 100 AS conversion_rate
FROM ecommerce_events;

-- Session activity
SELECT user_session, COUNT(*) AS events
FROM ecommerce_events
GROUP BY user_session
ORDER BY events DESC
LIMIT 5;
