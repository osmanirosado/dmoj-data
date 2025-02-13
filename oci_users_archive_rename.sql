
select username
from auth_user
where username like 'oci\_%';

select username
from auth_user
where username like '\_oci\_%';


# OCI organization

select *
from dmoj.judge_organization jo
where jo.short_name = 'OCI';

# username starts with oci_

select au.username
from dmoj.judge_organization jo
         join dmoj.judge_profile_organizations jpo on jo.id = jpo.organization_id
         join dmoj.judge_profile jp on jpo.profile_id = jp.id
         join dmoj.auth_user au on jp.user_id = au.id
where jo.short_name = 'OCI'
  and au.username like 'oci\_%';

# renaming usernames

update auth_user
set username = concat('_', username)
where id in (select au.id
             from dmoj.judge_organization jo
                      join dmoj.judge_profile_organizations jpo on jo.id = jpo.organization_id
                      join dmoj.judge_profile jp on jpo.profile_id = jp.id
                      join dmoj.auth_user au on jp.user_id = au.id
             where jo.short_name = 'OCI'
               and au.username like 'oci\_%');

# username starts with _oci_

select au.username
from dmoj.judge_organization jo
         join dmoj.judge_profile_organizations jpo on jo.id = jpo.organization_id
         join dmoj.judge_profile jp on jpo.profile_id = jp.id
         join dmoj.auth_user au on jp.user_id = au.id
where jo.short_name = 'OCI'
  and au.username like '\_oci\_%';

# remove users from the OCI organization

delete jpo
from dmoj.judge_organization jo
         join dmoj.judge_profile_organizations jpo on jo.id = jpo.organization_id
         join dmoj.judge_profile jp on jpo.profile_id = jp.id
         join dmoj.auth_user au on jp.user_id = au.id
where jo.short_name = 'OCI'
  and au.username like '\_oci\_%';
