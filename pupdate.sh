echo "============================================"
echo " Checking to see what updates are available "
echo "============================================"

wp plugin list --update=available

echo "Would you like to update all plugins that are aviable? "
read -e pupdate

# if the user didn't say no, then go ahead an install
if [ "$pupdate" == y ] ; then
wp plugin update-all
fi
