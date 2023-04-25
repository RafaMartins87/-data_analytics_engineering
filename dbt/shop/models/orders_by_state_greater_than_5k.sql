SELECT * FROM (SELECT
    c.customer_state,
    IF(
        count(EXTRACT(YEAR FROM DATE(o.order_approved_at)))>{{ var("quantity_orders") }},
        count(EXTRACT(YEAR FROM DATE(o.order_approved_at))),
        NULL
        ) AS num_orders 
FROM 
    `dbt_shop.orders` as o inner join `dbt_shop.customers`as c on o.customer_id = c.customer_id

WHERE 
    EXTRACT(YEAR FROM DATE(o.order_approved_at)) is not null
GROUP BY 1) as TB_AUX
WHERE num_orders IS NOT NULL



