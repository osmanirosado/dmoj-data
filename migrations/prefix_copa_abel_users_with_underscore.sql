-- Migration to prefix the username of copa users with _
-- Status: Applied

start transaction;

set @organization_short_name = 'Copa Abel';
set @username_pattern = '^copa[0-9]+$';

-- Remove users from the organization
delete jpo
from judge_organization jo
         join judge_profile_organizations jpo on jo.id = jpo.organization_id
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where jo.short_name = @organization_short_name
  and au.username regexp @username_pattern;

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
