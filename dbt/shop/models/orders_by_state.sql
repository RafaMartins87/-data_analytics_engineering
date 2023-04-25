SELECT
    c.customer_state,
    count(EXTRACT(YEAR FROM DATE(o.order_approved_at))) AS num_orders 
FROM 
    `dbt_shop.orders` as o inner join `dbt_shop.customers`as c on o.customer_id = c.customer_id

WHERE 
    EXTRACT(YEAR FROM DATE(o.order_approved_at)) is not null
GROUP BY 1