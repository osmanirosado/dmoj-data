select table_name             as referencing_table,
       column_name            as referencing_column,
       referenced_table_name  as referenced_table,
       referenced_column_name as referenced_column
from information_schema.key_column_usage
where referenced_table_name = 'auth_user'
  and referenced_table_schema = 'dmoj';

drop procedure if exists get_foreign_key_references;

delimiter //

create procedure get_foreign_key_references(
    in dbname varchar(255),
    in tablename varchar(255)
)
begin
    select table_name             as referencing_table,
           column_name            as referencing_column,
           referenced_table_name  as referenced_table,
           referenced_column_name as referenced_column
    from information_schema.key_column_usage
    where referenced_table_name = tablename
      and referenced_table_schema = dbname
    order by referencing_table;
end //

delimiter ;

call get_foreign_key_references('dmoj', 'auth_user');

call get_foreign_key_references('dmoj', 'judge_profile');
