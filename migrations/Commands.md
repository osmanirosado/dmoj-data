# Commands

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < archive_user_oci_ss1-.sql > output1.txt
```

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < archive_users_with_prefix_oci19.sql > output2.txt
```

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < delete_oci19_users.sql
```

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < archive_users_with_prefix_oci.sql
```

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < prefix_copa_users_with_underscore.sql
```
