# OCI users
select username
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$';

# Drop trigger
DROP TRIGGER IF EXISTS oci_prevent_password_update;

# Prevent password update when an OCI user is active
DELIMITER //

CREATE TRIGGER oci_prevent_password_update
    BEFORE UPDATE
    ON auth_user
    FOR EACH ROW
BEGIN
    DECLARE error_message VARCHAR(255);
    -- Check if the password is being changed
    IF NEW.password <> OLD.password THEN
        -- Check if the username starts with 'oci_' and if the user is active
        IF OLD.username REGEXP '^oci_[a-z]+[0-9]+$' AND OLD.is_active = 1 THEN
            -- Construct the error message using NEW.username
            SET error_message = CONCAT('Password update is not allowed for active users with username starting with "oci_". Actual user: "', NEW.username, '"');
            -- Raise an error to prevent the password update
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = error_message;
        END IF;
    END IF;
END;

//

DELIMITER ;

# ^+.3#'jTL!nwN2a

select username, password, is_active
from auth_user
where username = 'oci_test2';

# Active and change password for oci_test2 user
update auth_user
set password  = 'abc',
    is_active = 1
where username = 'oci_test2';

# Try to change the password of oci_test2 user: It fails
# [2025-02-10 09:11:14] [45000][1644] (conn=6) Password update is not allowed for active users with usernames starting with "oci_"
update auth_user
set password = 'xyz'
where username = 'oci_test2';

# Inactive oci_test2 user
update auth_user
set is_active = 0
where username = 'oci_test2';

# Try to change the password again: It works
update auth_user
set password = '123'
where username = 'oci_test2';


