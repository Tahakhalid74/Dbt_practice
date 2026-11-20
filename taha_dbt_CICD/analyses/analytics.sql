{# The section is used just for analysis and testing purposes. It is not part of the dbt model. #}

select * from {{ ref('lookup') }}