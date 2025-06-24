{%- macro MakeGridTool_04(table_name,schema,polygonColumnName,cell_size,unit) -%}
    {{ log("table_name=" ~ table_name, info=True) }}
    {{ log("schema=" ~ schema, info=True) }}
    {{ log("polygonColumnName=" ~ polygonColumnName, info=True) }}
    {{ log("cell_size=" ~ cell_size, info=True) }}
    {{ log("unit=" ~ unit, info=True) }}

    select
    andre_dev.alteryx_spatial.make_grid_old({{polygonColumnName}}, {{cell_size}}) as output
    from {{ table_name }}
{%- endmacro -%}