begin ;

# Archive new contest participation
update judge_contestparticipation t
set user_id = (select secondary_profile_id
               from oci_users
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_users);

# Archive new banned users
update judge_contest_banned_users t
set profile_id = (select secondary_profile_id
                  from oci_users
                  where t.profile_id = primary_profile_id)
where profile_id in (select primary_profile_id
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

# Archive new judge comments votes
update judge_commentvote t
set voter_id = (select secondary_profile_id
               from oci_users
               where t.voter_id = primary_profile_id)
where voter_id in (select primary_profile_id
                  from oci_users);

# Archive new judge tickets
update judge_ticket t
set user_id = (select secondary_profile_id
               from oci_users
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_users);

# Archive new judge ticket messages
update judge_ticketmessage t
set user_id = (select secondary_profile_id
               from oci_users
               where t.user_id = primary_profile_id)
where user_id in (select primary_profile_id
                  from oci_users);

commit ;
