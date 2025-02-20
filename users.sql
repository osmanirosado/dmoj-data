-- Sample query
select username, email, date_joined
from auth_user
order by date_joined desc;

-- Users joined in the last day
SELECT username, email, date_joined
FROM auth_user
WHERE date_joined >= DATE_SUB(CURDATE(), INTERVAL 1 DAY)
ORDER BY date_joined DESC;

-- Last login by user group
select REGEXP_SUBSTR(username, '^oci_[a-z]+')               AS user_group,
       CONVERT_TZ(MAX(last_login), 'UTC', 'America/Havana') AS group_last_login_cuba
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$'
group by user_group
order by group_last_login_cuba desc;

