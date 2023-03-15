#!/bin/sh

#export AWS_ACCESS_KEY_ID="[....]"
#export AWS_SECRET_ACCESS_KEY="[....]"

DEST=boto3+s3://my-backup-bucket/
GPG_KEY="45DBFFF2"
VERBOSE=""
#VERBOSE="-v8"

# Compression
COMPRESSION=""
#COMPRESSION="--gpg-options='--compress-algo=bzip2 --bzip2-compress-level=9'"

INCLUDES="--include /home/ubuntu/backups"

duplicity remove-older-than 2M ${DEST} --force
# duplicity ${VERBOSE} ${COMPRESSION} --s3-use-ia --encrypt-key ${GPG_KEY} --full-if-older-than 1M ${INCLUDES} --exclude '**' / ${DEST}
duplicity ${VERBOSE} ${COMPRESSION} --s3-use-ia --full-if-older-than 1D ${INCLUDES} --exclude '**' / ${DEST}
