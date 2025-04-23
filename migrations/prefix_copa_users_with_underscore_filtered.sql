-- Migration to prefix the username of copa users with _ from copa151 to copa210
-- Status: Applied

start transaction;

set @username_pattern = '^copa[0-9]+$';

-- Remove users from the organization
delete jpo
from judge_profile_organizations jpo
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where au.username regexp @username_pattern
  and cast(substring(au.username, length('copa') + 1) as unsigned) > 150;

-- Disable users
update auth_user
set is_active = 0
where username regexp @username_pattern;

-- Clear passwords
update auth_user
set password = ''
where username regexp @username_pattern;

-- Rename users
update auth_user
set username = concat('_', username)
where username regexp @username_pattern
  and cast(substring(username, length('copa') + 1) as unsigned) > 150;

commit;
