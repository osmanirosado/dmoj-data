-- Migration to archive the data of the user oci_ss1-
-- State: Applied

start transaction;

drop view if exists oci_users;

create view oci_users as
select pu.username as primary_username,
       su.username as secondary_username,
       pp.id       as primary_profile_id,
       sp.id       as secondary_profile_id,
       pu.id       as primary_user_id,
       su.id       as secondary_user_id
from auth_user pu
         join auth_user su on pu.username = 'oci_ss1-' and su.username = '_oci_ss1'
         join judge_profile pp on pu.id = pp.user_id
         join judge_profile sp on su.id = sp.user_id;

select *
from oci_users;

# Archive new contest participation
update judge_contestparticipation t
set user_id = (select secondary_profile_id
               from oci_users
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_users);

# Archive new submissions
update judge_submission t
set user_id = (select secondary_profile_id
               from oci_users
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_users);

# Archive new judge comments
update judge_comment t
set author_id = (select secondary_profile_id
                 from oci_users
                 where t.author_id = primary_profile_id)
where author_id in (select primary_profile_id
                    from oci_users);

drop view oci_users;

commit;
