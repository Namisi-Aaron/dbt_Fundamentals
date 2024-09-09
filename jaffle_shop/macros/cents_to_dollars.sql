{% macro cents_to_dollars(column_name, num=2) %}

round( ({{ column_name }} / 100) , {{ num }} )

{% endmacro %}