{{ config(materialized='table') }}

SELECT 
    DISTINCT product_id as item,
    (price + freight_value) as valor
FROM 
    `dbt_shop.items`