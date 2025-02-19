-- Migration to prefix the username of oci users with _
-- State: Applied 

select username
from auth_user
where username like 'oci\_%';

select username
from auth_user
where username like '\_oci\_%';


# OCI organization

select *
from judge_organization jo
where jo.short_name = 'OCI';

# username starts with oci_

select au.username
from judge_organization jo
         join judge_profile_organizations jpo on jo.id = jpo.organization_id
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where jo.short_name = 'OCI'
  and au.username like 'oci\_%';

# renaming usernames

update auth_user
set username = concat('_', username)
where id in (select au.id
             from judge_organization jo
                      join judge_profile_organizations jpo on jo.id = jpo.organization_id
                      join judge_profile jp on jpo.profile_id = jp.id
                      join auth_user au on jp.user_id = au.id
             where jo.short_name = 'OCI'
               and au.username like 'oci\_%');

# username starts with _oci_

select au.username
from judge_organization jo
         join judge_profile_organizations jpo on jo.id = jpo.organization_id
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where jo.short_name = 'OCI'
  and au.username like '\_oci\_%';

# remove users from the OCI organization

delete jpo
from judge_organization jo
         join judge_profile_organizations jpo on jo.id = jpo.organization_id
         join judge_profile jp on jpo.profile_id = jp.id
         join auth_user au on jp.user_id = au.id
where jo.short_name = 'OCI'
  and au.username like '\_oci\_%';
