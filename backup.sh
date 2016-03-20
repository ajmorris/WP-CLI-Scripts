echo "============================================"
echo " Let's backup WordPress! "
echo "============================================"

sleep 3

date="`date +%m%d%Y`"

wp db export backup-"$date".sql

tar -vczf backup-"$date".gz .

mv backup-"$date".gz /srv/www/backups/backup-"$date".gz

# rm -rf backup-*