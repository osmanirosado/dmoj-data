# get references recursively from auth_user table
with recursive relations as (select table_name, column_name, referenced_table_name, referenced_column_name
                             from information_schema.key_column_usage
                             where table_catalog = 'def'
                               and table_schema = 'dmoj'
                               and constraint_catalog = 'def'
                               and constraint_schema = 'dmoj'
                               and referenced_table_schema = 'dmoj'
                               and referenced_table_name = 'auth_user'
                               and referenced_column_name = 'id'
                             union
                             select a.table_name,
                                    a.column_name,
                                    a.referenced_table_name,
                                    a.referenced_column_name
                             from information_schema.key_column_usage a,
                                  relations b
                             where a.table_schema = 'dmoj'
                               and a.referenced_table_schema = 'dmoj'
                               and a.referenced_table_name = b.table_name)
select table_name, column_name, referenced_table_name, referenced_column_name
from relations;
