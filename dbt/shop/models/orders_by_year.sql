{{ config(materialized='table') }}

SELECT
    EXTRACT(YEAR FROM DATE(order_approved_at)) as year_order,
    count(EXTRACT(YEAR FROM DATE(order_approved_at))) AS num_orders 
FROM 
    `dbt_shop.orders`
WHERE EXTRACT(YEAR FROM DATE(order_approved_at)) is not null
GROUP BY 1