-- copa users

set @primary_username_pattern = '^copa[0-9]+$';

-- Primary Users
select username
from auth_user
where username regexp @primary_username_pattern
  and cast(substring(username, length('copa') + 1) as unsigned) > 150;

-- Organization
select au.username, jo.short_name
from judge_organization jo
         join judge_profile_organizations jpo on jo.id = jpo.organization_id
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where au.username regexp @primary_username_pattern
  and cast(substring(username, length('copa') + 1) as unsigned) > 150;
