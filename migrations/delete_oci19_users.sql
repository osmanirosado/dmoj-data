-- Migration to delete the users with username prefix equal to oci19
-- State: Applied

start transaction;

create view oci19_user as
select *
from auth_user
where username regexp '^oci19[a-z]+[0-9]+$';

# select count(*)
# from oci19_user;

delete
from judge_profile_organizations
where profile_id in (select jp.id
                     from judge_profile jp
                              join oci19_user au on jp.user_id = au.id);

delete
from judge_organizationrequest
where user_id in (select au.id from oci19_user au);

delete
from judge_profile
where user_id in (select au.id from oci19_user au);

delete
from auth_user
where id in (select au.id from oci19_user au);

drop view oci19_user;

commit;
