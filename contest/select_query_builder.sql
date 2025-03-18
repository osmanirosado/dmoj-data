drop function if exists build_select_query;

delimiter //

create function build_select_query(in referencing_table varchar(255), in referencing_column varchar(255))
    returns varchar(512)
begin
    declare result varchar(512);

    set @template = '
        select *
        from {{referencing_table}} s
        where s.{{referencing_column}} = @contest_object_id;
    ';

    -- Replace placeholders with actual values
    set @sql = replace(@template, '{{referencing_table}}', referencing_table);
    set @sql = replace(@sql, '{{referencing_column}}', referencing_column);

    select @sql into result;
    return result;
end //

delimiter ;

select build_select_query(table_name,
                          column_name) as query
from information_schema.key_column_usage
where referenced_table_name = 'judge_contest'
  and referenced_table_schema = 'dmoj';
