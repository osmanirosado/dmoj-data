# Prevent password update trigger

START TRANSACTION;

# Drop trigger if exists
DROP TRIGGER IF EXISTS prevent_password_update;

# Prevent password update when an OCI user is active
DELIMITER //

CREATE TRIGGER prevent_password_update
    BEFORE UPDATE
    ON auth_user
    FOR EACH ROW
BEGIN
    DECLARE error_message VARCHAR(255);
    -- Check if the password is being changed
    IF NEW.password <> OLD.password THEN
        -- Check if the username starts with 'oci_' or 'copa' and if the user is active
        IF (OLD.username REGEXP '^oci_[a-z]+[0-9]+$' OR
            OLD.username REGEXP '^copa[0-9]+$' OR
            OLD.username REGEXP '^psn_[0-9]+$') AND
           OLD.is_active = 1 THEN
            -- Construct the error message using NEW.username
            SET error_message = CONCAT(
                    'Password update is not allowed for some active users. Actual user: "', NEW.username, '"');
            -- Raise an error to prevent the password update
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = error_message;
        END IF;
    END IF;
END;

//

DELIMITER ;

COMMIT;
