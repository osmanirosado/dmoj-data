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
