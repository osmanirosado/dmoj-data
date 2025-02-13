
select username, email, date_joined
from auth_user
order by date_joined desc;

SELECT username, email, date_joined
FROM auth_user
WHERE date_joined >= DATE_SUB(CURDATE(), INTERVAL 1 DAY)
ORDER BY date_joined DESC;

select username
from auth_user
where username like '\_oci\_%';

update auth_user
set is_active = 0,
    password = ''
where username like '\_oci\_%';


