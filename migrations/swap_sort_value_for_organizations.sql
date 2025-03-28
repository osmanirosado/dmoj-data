-- Swap sort_value for the organizations

update judge_profile_organizations
set sort_value = case
                     when sort_value = 1 then 2
                     when sort_value = 2 then 1
                     else sort_value end
where profile_id in (select p.id
                     from judge_profile p
                              join auth_user u on p.user_id = u.id
                     where u.username regexp '^oci_[a-z]+[0-9]+$');

update judge_profile_organizations
set sort_value = case
                     when sort_value = 1 then 2
                     when sort_value = 2 then 1
                     else sort_value end
where profile_id in (select p.id
                     from judge_profile p
                              join auth_user u on p.user_id = u.id
                     where u.username regexp '^copa[0-9]+$');
