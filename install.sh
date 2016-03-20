#!/bin/bash -e

mysqlu="root"
mysqlp="root"

echo "======================================================"
echo " Create MySQL Database:  "
echo "======================================================"
echo -n "Enter database name: "
read dbname
echo -n "Enter database username: "
read dbuser
echo -n "Enter database user password: "
read dbpw

db="create database $dbname;create user $dbuser@localhost;SET PASSWORD FOR $dbuser@localhost= PASSWORD('$dbpw');GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@localhost IDENTIFIED BY '$dbpw';FLUSH PRIVILEGES;"
mysql -u root -p$mysqlp -e "$db"
 
if [ $? != "0" ]; then
 echo "[Error]: Database creation failed"
 exit 1
else
 echo "=========================================="
 echo " Database has been created successfully "
 echo "=========================================="
 echo " DB Info: "
 echo ""
 echo " DB Name: $dbname"
 echo " DB User: $dbuser"
 echo " DB Pass: $dbpw"
 echo ""
 echo "==========================================="
fi

clear

echo "============================================"
echo "Download and Install WordPress!!"
echo "============================================"

# accept the name of our website
echo "Site Name: "
read -e sitename

# accept the name of our website
echo "Username: "
read -e wpuser

# accept the name of our website
echo "Username Password: "
read -e password

# accept the name of our website
echo "Email: "
read -e adminemail

# add a simple yes/no confirmation before we proceed
echo "Run Install? (y/n)"
read -e run

# if the user didn't say no, then go ahead an install
if [ "$run" == n ] ; then
exit
else

# download the WordPress core files
wp core download

# create the wp-config file
wp core config --dbname=$dbname --dbuser=$dbuser --dbpass=$dbpw

# parse the current directory name
currentdirectory=${PWD##*/}

# create database, and install WordPress
# wp db create
wp core install --url="http://localhost/$currentdirectory" --title="$sitename" --admin_user="$wpuser" --admin_password="$password" --admin_email="$adminemail"

# install the _s theme
wp theme install https://github.com/Automattic/_s/archive/master.zip --activate

clear

echo "================================================================="
echo "Installation is complete. Your username/password is listed below."
echo ""
echo "Username: $wpuser"
echo "Password: $password"
echo ""
echo "================================================================="

fi

clear

# Prompt user for vars
# =============================================================================

# Get site dir name if not supplied as argument
if [ -d "/srv/www/$site" ]; then
	echo "Directory $path/www/$site already exists." red
	unset site
fi
while [ -z $site ]; do
	read -e -p "Name of new site directory: " site

	if [ -z $site ]; then
		echo "You must enter a directory name." red
	elif [ -d "/srv/www/$site" ]; then
		echo "Directory already exists." red
		unset site
	fi
done

# Get database name
db_name=$site

# Get local URL
while [ -z $domain ]; do
	echo -n "Domain to use (leave blank for $site.dev): "
	read domain
	if [ -z $domain ]; then
		domain="$site.dev"
	fi
done

cd /srv/config/nginx-config/sites
# add site config
echo "Creating nginx-config/sites/$site.conf... "
sed -e "s|testserver\.com|$domainname|" \
		-e "s|wordpress-local|$site/htdocs|" local-nginx-example.conf-sample > $site.conf

sed -e "sudo service nginx restart"

cd /srv/www
mkdir $site && cd $site






