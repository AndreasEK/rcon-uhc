#!/bin/sh
source env.sh

$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "list"
playersList=$( $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "list" )
playersList=$playersList",bitbrain"
playersList=$(echo $playersList | cut -d':' -f2)
echo "Players: " $playersList

for i in ${playersList//,/ }
do
    # call your procedure/other scripts here below
    echo Player: "$i"
done
