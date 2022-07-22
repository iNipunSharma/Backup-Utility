#installing mongo dump utility
#installing aws cli
#limit on backup size at tmp
#running with super user

#!/usr/bin/env bash
set -eu
#export HOME=/home/ubuntu/

HOST=

# DB name
DBNAME=

# S3 bucket name
BUCKET=

# Linux user account
USER=$USER

# Current time
TIME=`/bin/date +%d-%m-%Y-%T`

# Backup directory
DEST=/home/$USER/tmp

# Tar file of backup directory
TAR=$DEST/../$TIME.tar

# Create backup dir (-p to avoid warning if already exists)
/bin/mkdir -p $DEST

# Log
echo "Backing up $HOST to s3://$BUCKET/ on $TIME";

# Dump from mongodb host into backup directory
/usr/bin/mongodump --uri= $HOST -d $DBNAME -o $DEST

# Create tar of backup directory
/bin/tar cvf $TAR -C $DEST .

# Upload tar to s3
#/usr/local/bin/aws s3 cp $TAR s3://$BUCKET/ 
aws s3 cp $TAR s3://$BUCKET/

# Remove tar file locally
/bin/rm -f $TAR

# Remove backup directory
/bin/rm -rf $DEST

# All done
echo "Backup available at https://s3.amazonaws.com/$BUCKET/$TIME.tar"
