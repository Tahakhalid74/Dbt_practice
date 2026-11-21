

SELECT customer_id, city, dbt_valid_from, dbt_valid_to
FROM {{ ref('customers_scd_snapshot') }}
ORDER BY dbt_valid_from