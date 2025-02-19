# Contest Participation *
select au.username, c.name, c.start_time, c.end_time
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_contestparticipation jcp on jp.id = jcp.user_id
         join dmoj.judge_contest c on jcp.contest_id = c.id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Contest Banned Users *
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_contest_banned_users bu on jp.id = bu.profile_id
         join dmoj.judge_contest c on bu.contest_id = c.id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Submissions *
select au.username, p.name
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_submission s on jp.id = s.user_id
         join dmoj.judge_problem p on p.id = s.problem_id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Judge Ticket *
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_ticket t on jp.id = t.user_id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Judge Ticket Message *
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_ticketmessage tm on jp.id = tm.user_id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Comments
select au.username, c.body
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_comment c on jp.id = c.author_id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Comment Votes
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_commentvote cv on jp.id = cv.voter_id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Problem Banned Users
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_problem_banned_users pbu on jp.id = pbu.profile_id
         join dmoj.judge_contest c on pbu.profile_id = c.id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Problem Point Votes
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_problempointsvote ppv on jp.id = ppv.voter_id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Rating
select au.username, c.name, c.start_time, c.end_time
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_rating r on jp.id = r.user_id
         join dmoj.judge_contest c on r.contest_id = c.id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Contest Private Contestants
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_contest_private_contestants pc on jp.id = pc.profile_id
         join dmoj.judge_contest c on pc.contest_id = c.id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Contest Rate Exclude
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_contest_rate_exclude re on jp.id = re.profile_id
         join dmoj.judge_contest c on re.contest_id = c.id
where au.username regexp '^oci_[a-z]+[0-9]+$';

# Judge Ticket Assignees
select au.username
from auth_user au
         join dmoj.judge_profile jp on au.id = jp.user_id
         join dmoj.judge_ticket_assignees ta on jp.id = ta.profile_id
where au.username regexp '^oci_[a-z]+[0-9]+$';
