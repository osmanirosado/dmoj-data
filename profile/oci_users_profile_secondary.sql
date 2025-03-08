select count(*) as rows_count
from oci_user d
         join judge_rating s on d.secondary_profile_id = s.user_id;


select count(*) as rows_count
from oci_user d
         join judge_comment s on d.secondary_profile_id = s.author_id;


select count(*) as rows_count
from oci_user d
         join judge_webauthncredential s on d.secondary_profile_id = s.user_id;


select count(*) as rows_count
from oci_user d
         join judge_class_admins s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_ticket_assignees s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_class_members s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_authors s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contestparticipation s on d.secondary_profile_id = s.user_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_spectators s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_organizationrequest s on d.secondary_profile_id = s.user_id;


select count(*) as rows_count
from oci_user d
         join judge_problempointsvote s on d.secondary_profile_id = s.voter_id;


select count(*) as rows_count
from oci_user d
         join judge_problem_banned_users s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_view_contest_submissions s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_problem_curators s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_profile_organizations s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_curators s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_testers s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_ticketmessage s on d.secondary_profile_id = s.user_id;


select count(*) as rows_count
from oci_user d
         join judge_organization_admins s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_solution_authors s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_blogpost_authors s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_problem_authors s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_view_contest_scoreboard s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_problem_testers s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_commentvote s on d.secondary_profile_id = s.voter_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_rate_exclude s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_submission s on d.secondary_profile_id = s.user_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_private_contestants s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_contest_banned_users s on d.secondary_profile_id = s.profile_id;


select count(*) as rows_count
from oci_user d
         join judge_ticket s on d.secondary_profile_id = s.user_id;

