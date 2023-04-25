SELECT 
    DISTINCT i.order_id,
    (i.price + i.freight_value) as valor
FROM
    `dbt_shop.items` i inner join `dbt_shop.orders` o on i.order_id = o.order_id
WHERE o.order_status = 'shipped'