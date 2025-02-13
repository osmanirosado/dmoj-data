select il.*
from impersonate_impersonationlog il
         join dmoj.auth_user au on au.id = il.impersonating_id
where au.username = 'Carlos_D';

delete
from impersonate_impersonationlog
where impersonating_id = (select id from auth_user where username = 'Carlos_D');

select username
from auth_user;
