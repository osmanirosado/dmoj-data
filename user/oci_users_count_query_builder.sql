DELIMITER //

CREATE FUNCTION build_count_query(IN referencing_table VARCHAR(255), IN referencing_column VARCHAR(255),
                            IN referenced_table VARCHAR(255), IN referenced_column VARCHAR(255))
    RETURNS VARCHAR(512)
BEGIN
    DECLARE result VARCHAR(512);

    SET @template = '
        SELECT COUNT(*) AS rows_count
        FROM {{referenced_table}} d
            JOIN {{referencing_table}} s ON d.{{referenced_column}} = s.{{referencing_column}};
    ';

    -- Replace placeholders with actual values
    SET @sql = REPLACE(@template, '{{referenced_table}}', referenced_table);
    SET @sql = REPLACE(@sql, '{{referenced_column}}', referenced_column);
    SET @sql = REPLACE(@sql, '{{referencing_table}}', referencing_table);
    SET @sql = REPLACE(@sql, '{{referencing_column}}', referencing_column);

    SELECT @sql INTO result;
    RETURN result;
END //

DELIMITER ;

SELECT build_count_query('judge_contestparticipation', 'user_id',
                   'oci_user', 'primary_profile_id') as query;

SELECT build_count_query(TABLE_NAME,
                   COLUMN_NAME,
                   'oci_user',
                   'primary_profile_id') as query
FROM information_schema.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'judge_profile'
  AND REFERENCED_TABLE_SCHEMA = 'dmoj';

SELECT build_count_query(TABLE_NAME,
                   COLUMN_NAME,
                   'oci_user',
                   'secondary_profile_id') as query
FROM information_schema.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'judge_profile'
  AND REFERENCED_TABLE_SCHEMA = 'dmoj';
