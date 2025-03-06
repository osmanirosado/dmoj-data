SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_rating s ON d.secondary_profile_id = s.user_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_comment s ON d.secondary_profile_id = s.author_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_webauthncredential s ON d.secondary_profile_id = s.user_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_class_admins s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_ticket_assignees s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_class_members s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_authors s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contestparticipation s ON d.secondary_profile_id = s.user_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_spectators s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_organizationrequest s ON d.secondary_profile_id = s.user_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_problempointsvote s ON d.secondary_profile_id = s.voter_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_problem_banned_users s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_view_contest_submissions s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_problem_curators s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_profile_organizations s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_curators s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_testers s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_ticketmessage s ON d.secondary_profile_id = s.user_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_organization_admins s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_solution_authors s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_blogpost_authors s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_problem_authors s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_view_contest_scoreboard s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_problem_testers s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_commentvote s ON d.secondary_profile_id = s.voter_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_rate_exclude s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_submission s ON d.secondary_profile_id = s.user_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_private_contestants s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_contest_banned_users s ON d.secondary_profile_id = s.profile_id;


SELECT COUNT(*) AS rows_count
FROM oci_user d
         JOIN judge_ticket s ON d.secondary_profile_id = s.user_id;
    
