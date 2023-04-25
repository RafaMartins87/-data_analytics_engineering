SELECT
    CASE 
        WHEN customer_state IN ('SP','RJ','MG','ES') THEN 'SUDESTE'
        WHEN customer_state IN ('PR','SC','RS') THEN 'SUL'
        WHEN customer_state IN ('MS','GO','MT','DF') THEN 'CENTRO-OESTE'
        WHEN customer_state IN ('BA','PI','MA','CE','RN','PB','PE','AL','SE') THEN 'NORDESTE'
        WHEN customer_state IN ('AC','RO','AM','RR','PA','TO','AP') THEN 'NORTE'
        ELSE 'NULL' END AS REGIAO,
        count(EXTRACT(YEAR FROM DATE(o.order_approved_at))) AS num_orders
FROM      
    `dbt_shop.orders` as o inner join `dbt_shop.customers`as c on o.customer_id = c.customer_id
WHERE
    EXTRACT(YEAR FROM DATE(o.order_approved_at)) is not null
GROUP BY 1