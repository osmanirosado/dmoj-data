# DMOJ Database Backup

## DMOJ Server

```shell
ssh dmoj
```

El comando `mysqldump` se ejecuta dentro del contenedor `dmoj_mysql`.
El backup se escribe en el script `dmoj_db_backup_2025-02-10.sql` fuera del contenedor.
```shell
docker exec -i dmoj_mysql sh -c 'mysqldump -u root -p"$MYSQL_ROOT_PASSWORD" --routines --triggers dmoj' > ~/dmoj_db_backup_2025-02-16.sql
```

Un archivo zip es creado para guardar el backup
```shell
zip dmoj_db_backup_2025-02-10.zip dmoj_db_backup_2025-02-10.sql
```
```
  adding: dmoj_db_backup_2025-02-10.sql (deflated 89%)
```

Archivos creados
```shell
ls -lh dmoj_db_backup_2025-02-10.*
```
```
-rw-rw-r-- 1 uclv uclv 1.8G Feb 10 08:29 dmoj_db_backup_2025-02-10.sql
-rw-rw-r-- 1 uclv uclv 190M Feb 10 08:32 dmoj_db_backup_2025-02-10.zip
```

Ruta del archivo zip
```shell
realpath dmoj_db_backup_2025-02-10.zip
```
```
/home/uclv/dmoj_db_backup_2025-02-10.zip
```

## Local Desktop

```shell
scp dmoj:/home/uclv/dmoj_db_backup_2025-02-10.zip ~/Downloads/
```
```
dmoj_db_backup_2025-02-10.zip        100%  190MB  11.3MB/s   00:16
```

```shell
unzip ~/Downloads/dmoj_db_backup_2025-02-10.zip -d ~/DMOJ/dmoj-data/
```
```
Archive:  /home/osmani/Downloads/dmoj_db_backup_2025-02-10.zip
  inflating: /home/osmani/DMOJ/dmoj-data/dmoj_db_backup_2025-02-10.sql
```

```shell
docker compose up db
```

```shell
docker compose exec -T db sh -c 'mysql -u root -p"$MARIADB_ROOT_PASSWORD" dmoj' < dmoj_db_backup_2025-02-16.sql
```

```shell
docker compose exec -T db sh -c 'mysqldump -u root -p"$MARIADB_ROOT_PASSWORD" --routines --triggers --no-data dmoj' > dmoj_schema.sql
```

```shell
docker compose exec db sh -c 'mysql -u root -p"$MARIADB_ROOT_PASSWORD" dmoj'
```
