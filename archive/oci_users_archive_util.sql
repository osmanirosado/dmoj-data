# Contest Participation #

# Archived contest participation
select count(*)
from oci_user u
         join judge_contestparticipation rel on u.secondary_profile_id = rel.user_id;

# New contest participation
select count(*)
from oci_user u
         join judge_contestparticipation rel on u.primary_profile_id = rel.user_id;

# Archive new contest participation
update judge_contestparticipation t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Contest Banned Users #

# Archived contest banned users
select count(*) as archived_count
from oci_user u
         join judge_contest_banned_users rel on u.secondary_profile_id = rel.profile_id;

# New contest banned users
select count(*) as new_count
from oci_user u
         join judge_contest_banned_users rel on u.primary_profile_id = rel.profile_id;

# Archive new banned users
update judge_contest_banned_users t
set profile_id = (select secondary_profile_id
                  from oci_user
                  where t.profile_id = primary_profile_id)
where profile_id in (select primary_profile_id
                     from oci_user);

# Submissions #

# Archived submissions
select count(*) as archived_count
from oci_user u
         join judge_submission rel on u.secondary_profile_id = rel.user_id;

# New submissions
select count(*) as new_count
from oci_user u
         join judge_submission rel on u.primary_profile_id = rel.user_id;

# Archive new submissions
update judge_submission t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Judge Ticket #

# Archived judge tickets
select count(*) as archived_count
from oci_user u
         join judge_ticket rel on u.secondary_profile_id = rel.user_id;

# New judge tickets
select count(*) as new_count
from oci_user u
         join judge_ticket rel on u.primary_profile_id = rel.user_id;

# Archive new judge tickets
update judge_ticket t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Judge Ticket Message #

# Archived judge ticket messages
select count(*) as archived_count
from oci_user u
         join judge_ticketmessage rel on u.secondary_profile_id = rel.user_id;

# New judge ticket messages
select count(*) as new_count
from oci_user u
         join judge_ticketmessage rel on u.primary_profile_id = rel.user_id;

# Archive new judge ticket messages
update judge_ticketmessage t
set user_id = (select secondary_profile_id
               from oci_user
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_user);

# Comments #

# Archived comments
select count(*) as archived_count
from oci_user u
         join judge_comment rel on u.secondary_profile_id = rel.author_id;

# New comments
select count(*) as new_count
from oci_user u
         join judge_comment rel on u.primary_profile_id = rel.author_id;

# Comments Votes #

# Archived comments votes
select count(*) as archived_count
from oci_user u
         join judge_commentvote rel on u.secondary_profile_id = rel.voter_id;

# New comments votes
select count(*) as new_count
from oci_user u
         join judge_commentvote rel on u.primary_profile_id = rel.voter_id;

