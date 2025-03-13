-- Migration to prefix the username of copa users with _
-- The queries for revision are stored on user/copa_abel_users.sql

start transaction;

set @organization_short_name = 'Copa Abel' collate utf8mb4_uca1400_as_ci;
set @username_pattern = '^copa[0-9]+$' collate utf8mb4_uca1400_as_ci;

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
