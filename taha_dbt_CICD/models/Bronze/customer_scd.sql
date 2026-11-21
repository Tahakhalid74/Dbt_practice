
select 
    * 
from {{ source('source', 'customers_scd') }}

