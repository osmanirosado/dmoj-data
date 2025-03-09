# DMOJ Database

## DMOJ Server

```shell
ssh dmoj
```

```shell
docker exec -it dmoj_mysql sh -c 'mysql -u root -p"$MYSQL_ROOT_PASSWORD"'
```

```mariadb
show databases;
```

```mariadb
use dmoj;
```

```mariadb
select username
from auth_user
where username like 'oci\_%';
```
