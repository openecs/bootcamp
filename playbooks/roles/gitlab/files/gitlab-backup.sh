#!/bin/bash

# https://docs.gitlab.com/ee/raketasks/backup_restore.html
#
# Warning: Your gitlab.rb and gitlab-secrets.json files contain sensitive data
# and are not included in this backup. You will need these files to restore a backup.
# Please back them up manually.

# CRON 
# 0 2 * * * /opt/gitlab/bin/gitlab-rake gitlab:backup:create CRON=1
# Use for rsync without timestamp
# gitlab-rake gitlab:backup:create BACKUP=dump GZIP_RSYNCABLE=yes

# To restore
# stop GitLab
# sudo gitlab-rake gitlab:backup:restore BACKUP=<backup-file>
# restore /etc/gitlab/gitlab-secrets.json if necessary as mentioned above.
# stop GitLab