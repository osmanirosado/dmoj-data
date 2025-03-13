-- Copa Abel users

set @organization_short_name = 'Copa Abel';
set @primary_username_pattern = '^copa[0-9]+$';
set @secondary_username_pattern = '^_copa[0-9]+$';
select @secondary_username_pattern;

-- Primary Users
select username
from auth_user
where username regexp @primary_username_pattern;

-- Organization
select au.username, jo.short_name
from judge_organization jo
         join judge_profile_organizations jpo on jo.id = jpo.organization_id
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where jo.short_name = @organization_short_name
  and au.username regexp @primary_username_pattern;

-- Secondary Users
select username
from auth_user
where username regexp @secondary_username_pattern;
