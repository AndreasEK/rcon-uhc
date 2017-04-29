#!/bin/bash

############################################################
#                  Event_17_Positions.sh                   #
#                                                          #
#                                                          #
# No arguments to the script.                              #
#                                                          #
############################################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
#sleep $(( $EFFECT_WAIT - 10 ))

#echo "EVENT: Wer ist wo?"

# show event title and subtitle for 5 seconds
#./announce.sh "Kartenleser!" yellow "Alle Spielerpositionen werden bekanntgegeben..." white 5

# countdown 5 seconds
#./countdown.sh 5

#
# Run the event
#
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
