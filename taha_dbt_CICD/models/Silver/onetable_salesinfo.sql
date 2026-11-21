
with simp_join as (
select 
    bs.net_amount,
    bs.gross_amount,
    bs.payment_method,
    bp.category,
    bdc.gender
from {{ ref('bronze_sales') }} bs
left join {{ ref('bronze_dim_customer') }} as bdc
    on bs.customer_sk = bdc.customer_sk 
left join {{ ref('bronze_product') }} as bp
    on bs.product_sk = bp.product_sk
) 

select 
    category,
    gender,
    round(sum(net_amount), 2) as total_net_amount
from 
    simp_join
group by 
    category,
    gender
order by 
    total_net_amount desc

