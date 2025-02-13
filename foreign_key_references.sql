SELECT TABLE_NAME             AS referencing_table,
       COLUMN_NAME            AS referencing_column,
       REFERENCED_TABLE_NAME  AS referenced_table,
       REFERENCED_COLUMN_NAME AS referenced_column
FROM information_schema.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_NAME = 'auth_user'
  AND REFERENCED_TABLE_SCHEMA = 'dmoj';

DROP PROCEDURE IF EXISTS get_foreign_key_references;

DELIMITER //

CREATE PROCEDURE get_foreign_key_references(
    IN dbName VARCHAR(255),
    IN tableName VARCHAR(255)
)
BEGIN
    SELECT TABLE_NAME             AS referencing_table,
           COLUMN_NAME            AS referencing_column,
           REFERENCED_TABLE_NAME  AS referenced_table,
           REFERENCED_COLUMN_NAME AS referenced_column
    FROM information_schema.KEY_COLUMN_USAGE
    WHERE REFERENCED_TABLE_NAME = tableName
      AND REFERENCED_TABLE_SCHEMA = dbName
    ORDER BY referencing_table;
END //

DELIMITER ;

CALL get_foreign_key_references('dmoj', 'auth_user');

CALL get_foreign_key_references('dmoj', 'judge_profile');
