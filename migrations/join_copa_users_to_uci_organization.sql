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
