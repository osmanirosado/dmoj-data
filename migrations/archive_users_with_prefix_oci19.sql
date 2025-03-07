-- Migration to archive the users with username prefix equal to oci19
-- State: Applied

start transaction;

drop view if exists oci19_user;

# OCI users mapping
create view oci19_user as
select pu.username as primary_username,
       su.username as secondary_username,
       pp.id       as primary_profile_id,
       sp.id       as secondary_profile_id,
       pu.id       as primary_user_id,
       su.id       as secondary_user_id
from auth_user pu
         join auth_user su
              on pu.username regexp '^oci19[a-z]+[0-9]+$' and su.username = replace(pu.username, 'oci19', '_oci_')
         join judge_profile pp on pu.id = pp.user_id
         join judge_profile sp on su.id = sp.user_id;

# select *
# from oci19_user;

# Archive new contest participation
update judge_contestparticipation t
set user_id = (select secondary_profile_id
               from oci19_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci19_user);

# Archive new submissions
update judge_submission t
set user_id = (select secondary_profile_id
               from oci19_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci19_user);

# Archive new judge comments
update judge_comment t
set author_id = (select secondary_profile_id
                 from oci19_user
                 where t.author_id = primary_profile_id)
where author_id in (select primary_profile_id
                    from oci19_user);

# Archive new judge comments votes
update judge_commentvote t
set voter_id = (select secondary_profile_id
                from oci19_user
                where t.voter_id = primary_profile_id)
where voter_id in (select primary_profile_id
                   from oci19_user);

# Archive new judge tickets
update judge_ticket t
set user_id = (select secondary_profile_id
               from oci19_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci19_user);

# Archive new judge ticket messages
update judge_ticketmessage t
set user_id = (select secondary_profile_id
               from oci19_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci19_user);

# Archive new reversion data
update reversion_revision r
set user_id = (select secondary_user_id
               from oci19_user
               where r.user_id = primary_user_id)
where user_id in (select primary_user_id
                  from oci19_user);

drop view oci19_user;

commit;
