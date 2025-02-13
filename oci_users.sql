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

# User mapping
create table oci_user
(
    primary_username     varchar(150) not null,
    secondary_username   varchar(150) not null,
    primary_profile_id   int          not null,
    secondary_profile_id int          not null
);

delete
from oci_user
where true;

insert into oci_user(primary_username, secondary_username, primary_profile_id, secondary_profile_id)
select pu.username, su.username, pp.id, sp.id
from auth_user pu
         join auth_user su on pu.username regexp '^oci_[a-z]+[0-9]+$' and su.username = concat('_', pu.username)
         join judge_profile pp on pu.id = pp.user_id
         join judge_profile sp on su.id = sp.user_id;

