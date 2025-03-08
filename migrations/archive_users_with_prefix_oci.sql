-- Migration to archive the data of the users with username prefix equal to oci_
-- State: Applied

start transaction;

drop view if exists oci_user;

# OCI users mapping
create view oci_user as
select pu.username as primary_username,
       su.username as secondary_username,
       pp.id       as primary_profile_id,
       sp.id       as secondary_profile_id,
       pu.id       as primary_user_id,
       su.id       as secondary_user_id
from auth_user pu
         join auth_user su on pu.username regexp '^oci_[a-z]+[0-9]+$' and su.username = concat('_', pu.username)
         join judge_profile pp on pu.id = pp.user_id
         join judge_profile sp on su.id = sp.user_id;

# select *
# from oci_user;

# Archive new contest participation
update judge_contestparticipation t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);


# Archive new banned users
update judge_contest_banned_users t
set profile_id = (select secondary_profile_id
                  from oci_user
                  where t.profile_id = primary_profile_id)
where profile_id in (select primary_profile_id
                     from oci_user);

# Archive new submissions
update judge_submission t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Archive new judge tickets
update judge_ticket t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Archive new judge ticket messages
update judge_ticketmessage t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Archive new reversion data
update reversion_revision r
set user_id = (select secondary_user_id
               from oci_user
               where r.user_id = primary_user_id)
where user_id in (select primary_user_id
                  from oci_user);

drop view oci_user;

commit;
