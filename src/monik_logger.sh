#!/bin/sh
#
# Monik logger. Sends data from STDIN to the Monik server.
#
# 2011. Created by Laurynas Butkus, laurynas.butkus@gmail.com
#
# -------------------------------------------------------------------------------------------------

# Monik authentication details
CLIENT_ID=1
TOKEN=ae17354fc36916cfed79ee33bdf12bb0

# -------------------------------------------------------------------------------------------------

# Monik loger URL
URL="http://localhost:3000/api/main/log"

# Use CURL
CURL=/usr/bin/curl

if [ ! -x $CURL ]; then
    echo "Error: cannot find curl"
    exit 1
fi

$CURL -F data=@- --url "$URL?client_id=$CLIENT_ID&token=$TOKEN"

