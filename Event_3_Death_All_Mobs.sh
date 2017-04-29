#!/bin/bash

############################################################
#                 Event_3_Death_All_Mobs.sh                #
#                                                          #
# All mobs within a radius of 20 blocks around each player #
# are killed - leaving xp points behind for pickup. :)     #
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
    echo "EVENT: Tod den Mobs!"
    ./announce.sh "Tod den Mobs!" green \
                  "Alle Mobs im Umkreis von 20 Blöcken um jeden Spieler sterben!" white 5
    ./countdown.sh 5
fi

#
# run the event
#
$RCON_CMD "/execute @a[type=player,m=0] ~ ~ ~ /kill @e[type=!player,r=20]"

