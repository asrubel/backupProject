#!/bin/sh

TIMESTAMP=$(date +%d-%m-%Y"_"%H_%M_%S)

docker exec -t postgres pg_dump -c -U postgres > /home/ubuntu/backups/dump_$TIMESTAMP.sql
echo "Postgres dumped $TIMESTAMP" >> backup.log

aws s3 cp /home/ubuntu/backups/dump_$TIMESTAMP.sql s3://mybucket-for-college/backups/postgres_backup.sql
echo "Dump loaded to AWS S3 $TIMESTAMP" >> backup.log
