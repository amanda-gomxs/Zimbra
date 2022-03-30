#!/bin/bash

HOST_SOURCE=[IP de origem]
HOST_DEST=[IP de destino]
ADMIN_SOURCE="conta@domínio.com"
PWD_SOURCE="[senha admin origem]"
ADMIN_DEST="conta@domínio.com"
PWD_DEST="[senha admin destino]"


for L in `cat /imapsync/file_sinc.txt`
do
        USER=$(echo $L | cut -d ":" -f1)
        USER2=$(echo $L | cut -d ":" -f1)
        echo "==== Starting imapsync from $HOST_SOURCE $USER to $HOST_DEST $USER2  ===="

        # Migra os dados via Imapsync
        /usr/bin/imapsync \
        --host1 $HOST_SOURCE --authuser1 $ADMIN_SOURCE --password1 $PWD_SOURCE --user1 $USER --authmech1 PLAIN  --tls1 \
        --host2 $HOST_DEST --authuser2 $ADMIN_DEST --password2 $PWD_BTZ --user2 $USER2 --authmech2 PLAIN --skipsize --allowsizemismatch --noerrorsdump --idatefromheader --addheader \

        echo "==== Ended imapsync from $HOST_SOURCE $USER to $HOST_DEST $USER2 ===="
        echo
done
< file.txt