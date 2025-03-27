-- Queries to get info about OCI user organizations

select u.username, o.short_name, po.sort_value
from auth_user u
         join judge_profile p on u.id = p.user_id
         join judge_profile_organizations po on p.id = po.profile_id
         join judge_organization o on po.organization_id = o.id
where u.username regexp '^oci_[a-z]+[0-9]+$'
order by u.username, po.sort_value;

select name, short_name
from judge_organization
where short_name = 'OCI'
   or short_name like 'OCI-%';
