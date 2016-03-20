echo "============================================"
echo " Checking to see if WordPress is Updatable  "
echo "============================================"

wp core check-update

echo "Would you like to update WordPress? "
read -e cupdate

# if the user didn't say no, then go ahead an install
if [ "$cupdate" == y ] ; then
wp core update
fi
