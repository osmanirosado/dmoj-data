-- Migration to prefix the username of PSN users with _
-- Status: Applied

start transaction;

set @username_pattern = '^psn_[0-9]+$';

-- Remove users from the organization
delete jpo
from judge_profile_organizations jpo
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where au.username regexp @username_pattern;

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
where username regexp @username_pattern;

commit;
