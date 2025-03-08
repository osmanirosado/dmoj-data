delimiter //

create function build_count_query(in referencing_table varchar(255), in referencing_column varchar(255),
                                  in referenced_table varchar(255), in referenced_column varchar(255))
    returns varchar(512)
begin
    declare result varchar(512);

    set @template = '
        select count(*) as rows_count
        from {{referenced_table}} d
            join {{referencing_table}} s on d.{{referenced_column}} = s.{{referencing_column}};
    ';

    -- Replace placeholders with actual values
    set @sql = replace(@template, '{{referenced_table}}', referenced_table);
    set @sql = replace(@sql, '{{referenced_column}}', referenced_column);
    set @sql = replace(@sql, '{{referencing_table}}', referencing_table);
    set @sql = replace(@sql, '{{referencing_column}}', referencing_column);

    select @sql into result;
    return result;
end //

delimiter ;

select build_count_query('judge_contestparticipation', 'user_id',
                   'oci_user', 'primary_profile_id') as query;

select build_count_query(table_name,
                         column_name,
                   'oci_user',
                   'primary_profile_id') as query
from information_schema.key_column_usage
where referenced_table_name = 'judge_profile'
  and referenced_table_schema = 'dmoj';

select build_count_query(table_name,
                         column_name,
                   'oci_user',
                   'secondary_profile_id') as query
from information_schema.key_column_usage
where referenced_table_name = 'judge_profile'
  and referenced_table_schema = 'dmoj';
