# Secondary Users
select username
from auth_user
where username regexp '^_oci_[a-z]+[0-9]+$';

# Primary Users
select username
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$';

# Primary users without secondary users
select username as name
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$'
except
select substring(username, 2)
from auth_user
where username regexp '^_oci_[a-z]+[0-9]+$';

# Secondary users without primary users
select username
from auth_user
where username regexp '^_oci_[a-z]+[0-9]+$'
except
select concat('_', username) as name
from auth_user
where username regexp '^oci_[a-z]+[0-9]+$';

# OCI users mapping
create view oci_users as
select pu.username as primary_username,
       su.username as secondary_username,
       pp.id       as primary_profile_id,
       sp.id       as secondary_profile_id
from auth_user pu
         join auth_user su on pu.username regexp '^oci_[a-z]+[0-9]+$' and su.username = concat('_', pu.username)
         join judge_profile pp on pu.id = pp.user_id
         join judge_profile sp on su.id = sp.user_id;

select * from oci_users;

# OCI users table
create table oci_user_materialized
(
    primary_username     varchar(150) not null,
    secondary_username   varchar(150) not null,
    primary_profile_id   int          not null,
    secondary_profile_id int          not null
);

insert into oci_user_materialized(primary_username, secondary_username, primary_profile_id, secondary_profile_id)
select primary_username, secondary_username, primary_profile_id, secondary_profile_id
from oci_users;

delete
from oci_user_materialized
where true;

drop table oci_user_materialized;
drop view oci_users;
