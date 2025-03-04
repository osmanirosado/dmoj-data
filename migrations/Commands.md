# Commands

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < 01_archive_user_oci_ss1-.sql > output1.txt
```

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < 02_archive_users_with_prefix_oci19.sql > output2.txt
```

```shell
docker exec -i dmoj_mysql sh -c 'mysql -v -u root -p"$MYSQL_ROOT_PASSWORD" dmoj' < 03_delete_oci19_users.sql
```
