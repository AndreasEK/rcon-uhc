#!/bin/bash

############################################################
#                  Event_17_Positions.sh                   #
#                                                          #
# Announce player positions in the chat.                   #
#                                                          #
# Arguments:                                               #
#   sleep - Sleeping time in seconds                       #
#   [any] - any argument to the script causes skipping     #
#           sleeping, announcement and countdown.          #
#           Very handy for testing purposes.               #
#                                                          #
############################################################

source env.sh

# parse sleep time parameter
if [ -z $1 ]; then
    sleeptime=$(( EFFECT_WAIT + 20 ))
else
    sleeptime=$1
fi

# short cut for debugging
if [ -z $2 ]; then
    # sleep the configured time
    sleep $sleeptime
    # Announce and countdown
    echo "EVENT: Wer ist wo?"
    ./announce.sh "Kartenleser!" yellow \
                  "Alle Spielerpositionen werden bekanntgegeben..." white 5
    ./countdown.sh 5
fi

#
# Run the event
#
playersList=$( $RCON_CMD "list" )
playersList=$playersList",bitbrain"
playersList=$(echo $playersList | cut -d':' -f2)
echo "Players: " $playersList

for i in ${playersList//,/ }
do
    # call your procedure/other scripts here below
    echo Player: "$i"
done
