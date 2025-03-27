-- Swap sort_value for the organizations of the oci users
-- State: Applied

update judge_profile_organizations
set sort_value = case
                     when sort_value = 1 then 2
                     when sort_value = 2 then 1
                     else sort_value end
where profile_id in (select p.id
                     from judge_profile p
                              join auth_user u on p.user_id = u.id
                     where u.username regexp '^oci_[a-z]+[0-9]+$');

-- Review query
select u.username, o.short_name, po.sort_value
from auth_user u
         join judge_profile p on u.id = p.user_id
         join judge_profile_organizations po on p.id = po.profile_id
         join judge_organization o on po.organization_id = o.id
where u.username regexp '^oci_[a-z]+[0-9]+$'
order by u.username, po.sort_value;
