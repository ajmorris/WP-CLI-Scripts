# wp plugin install adminimize --activate
# wp plugin install members --activate
# wp plugin install transients-manager --activate
# wp plugin install w3-total-cache --activate
# wp plugin install user-switching --activate
# wp plugin install wordpress-seo --activate
# wp plugin install starbox --activate
# wp plugin install better-wp-security --activate
# wp plugin install woocommerce --activate
# wp plugin install google-analytics-for-wordpress --activate
# wp plugin install jetpack --activate
# wp plugin install sucuri-scanner --activate

echo "============================================"
echo " Install WordPress basics!! "
echo "============================================"

echo "Would you like to install Adminimize? "
read -e adminimize

# if the user didn't say no, then go ahead an install
if [ "$adminimize" == y ] ; then
# Adminimize
wp plugin install adminimize --activate
fi

echo "Would you like to install Members? "
read -e members

# if the user didn't say no, then go ahead an install
if [ "$members" == y ] ; then
# Members
wp plugin install members --activate
fi

echo "Would you like to install Transients Manager? "
read -e tman

# if the user didn't say no, then go ahead an install
if [ "$tman" == y ] ; then
# Transients Manager
wp plugin install transients-manager --activate
fi

echo "Would you like to install w3 Total Cache? "
read -e totalcache

# if the user didn't say no, then go ahead an install
if [ "$pupdate" == y ] ; then
# w3 total cache
wp plugin install w3-total-cache --activate
fi

echo "Would you like to install User Switching? "
read -e uswitch

# if the user didn't say no, then go ahead an install
if [ "$uswitch" == y ] ; then
# User Switching
wp plugin install user-switching --activate
fi

echo "Would you like to install WordPress SEO? "
read -e wpseo

# if the user didn't say no, then go ahead an install
if [ "$wpseo" == y ] ; then
# WordPress SEO
wp plugin install wordpress-seo --activate
fi

echo "Would you like to install Starbox? "
read -e starbox

# if the user didn't say no, then go ahead an install
if [ "$starbox" == y ] ; then
# Starbox
wp plugin install starbox --activate
fi

echo "Would you like to install iThemes Security? "
read -e itsec

# if the user didn't say no, then go ahead an install
if [ "$itsec" == y ] ; then
# iThemes Security
wp plugin install better-wp-security --activate
fi

echo "Would you like to install WooCommerce? "
read -e woocomm

# if the user didn't say no, then go ahead an install
if [ "$woocomm" == y ] ; then
# WooComm
wp plugin install woocommerce --activate
fi

echo "Would you like to install Google Analytics by Yoast? "
read -e gyoast

# if the user didn't say no, then go ahead an install
if [ "$gyoast" == y ] ; then
# GA by Yoast
wp plugin install google-analytics-for-wordpress --activate
fi

echo "Would you like to install Jetpack? "
read -e jetpack

# if the user didn't say no, then go ahead an install
if [ "$jetpack" == y ] ; then
# Jetpack
wp plugin install jetpack --activate
fi

echo "Would you like to install Sucuri Security? "
read -e sucurisec

# if the user didn't say no, then go ahead an install
if [ "$sucurisec" == y ] ; then
# Sucuri Security
wp plugin install sucuri-scanner --activate
fi
