-- Queries to reset the profile data of the users with username prefix equal to copa

# Secondary users
update judge_profile
set points             = 0,
    problem_count      = 0,
    performance_points = 0,
    rating             = null,
    current_contest_id = null
where user_id in (select id
                  from auth_user
                  where username regexp '^_copa[0-9]+$');

# Primary users
update judge_profile
set points             = 0,
    problem_count      = 0,
    performance_points = 0,
    rating             = null,
    current_contest_id = null
where user_id in (select id
                  from auth_user
                  where username regexp '^copa[0-9]+$');
