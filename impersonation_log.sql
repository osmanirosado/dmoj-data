-- User deletion request by a user
-- The existence of impersonation log records prevents the deletion of a user on the administration site

-- Query to filter impersonation logs for a user
select il.*
from impersonate_impersonationlog il
         join dmoj.auth_user au on au.id = il.impersonating_id
where au.username = '';

-- You need to clean impersonation log records for a user if you need to delete that user on the administration site
delete
from impersonate_impersonationlog
where impersonating_id = (select id from auth_user where username = '');
