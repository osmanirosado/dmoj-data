# OCI users
select username
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$';

# Test user
select username, is_active
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
