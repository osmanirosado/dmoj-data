show variables like 'character_set_server';
show variables like 'collation_server';

select schema_name, default_character_set_name, default_collation_name
from information_schema.schemata
where schema_name = 'dmoj';

show table status like 'auth_user';

show full columns from auth_user;
