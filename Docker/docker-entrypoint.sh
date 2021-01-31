#! /bin/bash

set -e

OWNER=$(stat -c '%u' /var/www)
GROUP=$(stat -c '%g' /var/www)
USERNAME=www-data

echo "OWNER=$OWNER GROUP=$GROUP"

if [ "$OWNER" != "0" ]; then
    echo "Changing $USERNAME"
    usermod -o -u $OWNER $USERNAME
    groupmod -o -g $GROUP $USERNAME
fi

echo "Apache user and group has been set to the following"
id $USERNAME

exec /usr/sbin/apache2ctl -D FOREGROUND