{# {# {%set var_name = 'Taha Khalid'%}

{{var_name}}


{% set fruits = ['apple', 'banana', 'orange', 'grape', 'mango'] %}

{% for fruit in fruits %}
    {% if fruit != 'banana' %}
        {{ fruit }}
    {% else %}
        I hate {{ fruit }}
    {% endif %}
{% endfor %}

 #}

{% set cols_list = ['sales_id', 'date_sk', 'gross_amount'] %}

{% set initial_load = 1 %}
{% set last_load = 3 %}

SELECT
    {% for i in cols_list %}
        {{ i }}{% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ ref('bronze_sales') }}

{% if initial_load == 1 %}
WHERE date_sk > {{ last_load }}
{% endif %}

 #}

