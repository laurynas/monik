#!/bin/sh
#
# Monik logger. Sends data from STDIN to the Monik server.
#
# 2011. Created by Laurynas Butkus, laurynas.butkus@gmail.com
#
# -------------------------------------------------------------------------------------------------

# Monik authentication details
LISTENER_ID=1
TOKEN=f86545bfeb39fe060c2ecc8c3f4b48b9

# -------------------------------------------------------------------------------------------------

# Monik loger URL
URL="http://localhost:3000/api/main/log"

# Use CURL
CURL=/usr/bin/curl

if [ ! -x $CURL ]; then
    echo "Error: cannot find curl"
    exit 1
fi

$CURL -F data=@- --url "$URL?listener_id=$LISTENER_ID&token=$TOKEN"

