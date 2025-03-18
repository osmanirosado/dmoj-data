set @contest_object_id = (select id
                          from judge_contest
                          where `key` = 'eolimpica24');

select *
from judge_rating s
where s.contest_id = @contest_object_id;


select *
from judge_contest_classes s
where s.contest_id = @contest_object_id;


select *
from judge_contest_authors s
where s.contest_id = @contest_object_id;


select *
from judge_contestparticipation s
where s.contest_id = @contest_object_id;


select *
from judge_contest_spectators s
where s.contest_id = @contest_object_id;


select *
from judge_contest_organizations s
where s.contest_id = @contest_object_id;


select *
from judge_contest_view_contest_submissions s
where s.contest_id = @contest_object_id;


select *
from judge_contest_curators s
where s.contest_id = @contest_object_id;


select *
from judge_contest_testers s
where s.contest_id = @contest_object_id;


select *
from judge_contest_join_organizations s
where s.contest_id = @contest_object_id;


select *
from judge_contest_tags s
where s.contest_id = @contest_object_id;


select *
from judge_contest_view_contest_scoreboard s
where s.contest_id = @contest_object_id;


select *
from judge_contest_rate_exclude s
where s.contest_id = @contest_object_id;


select *
from judge_submission s
where s.contest_object_id = @contest_object_id;


select *
from judge_contestproblem s
where s.contest_id = @contest_object_id;


select *
from judge_contest_private_contestants s
where s.contest_id = @contest_object_id;


select *
from judge_contest_banned_users s
where s.contest_id = @contest_object_id;


select *
from judge_contestmoss s
where s.contest_id = @contest_object_id;
                          
