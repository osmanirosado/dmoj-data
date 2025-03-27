-- Query to join 'copa' users to 'Copa UCI' organization
-- State: Applied

insert into judge_profile_organizations(profile_id, organization_id, sort_value)
select p.id,
       (select id
        from judge_organization
        where short_name = 'Copa UCI'),
       1
from auth_user u
         join judge_profile p on u.id = p.user_id
where u.username regexp '^copa[0-9]+$';

-- Update sort value
update judge_profile_organizations
set sort_value = 2
where profile_id in (select p.id
                     from judge_profile p
                              join auth_user u on p.user_id = u.id
                     where u.username regexp '^copa[0-9]+$')
  and organization_id = (select id
                         from judge_organization
                         where short_name = 'Copa UCI');
