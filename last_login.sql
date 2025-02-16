select REGEXP_SUBSTR(username, '^oci_[a-z]+')               AS user_group,
       CONVERT_TZ(MAX(last_login), 'UTC', 'America/Havana') AS group_last_login_cuba
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$'
group by user_group
order by group_last_login_cuba desc;
