-- Queries to reset the profile data of the users with username prefix equal to oci_

select username, points, display_rank, rating, problem_count, performance_points
from judge_profile p
         join auth_user au on au.id = p.user_id
where username = 'oci_ss1';

# Secondary users
update judge_profile
set points             = 0,
    problem_count      = 0,
    performance_points = 0,
    rating             = null,
    current_contest_id = null
where user_id in (select id
                  from auth_user
                  where username regexp '^_oci_[a-z]+[0-9]+$');

# Primary users
update judge_profile
set points             = 0,
    problem_count      = 0,
    performance_points = 0,
    rating             = null,
    current_contest_id = null
where user_id in (select id
                  from auth_user
                  where username regexp '^oci_[a-z]+[0-9]+$'
                    and username <> 'oci_test2');
