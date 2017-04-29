#!/bin/bash

############################################################
#                 Event_3_Death_All_Mobs.sh                #
#                                                          #
# All mobs within a radius of 20 blocks around each player #
# are killed - leaving xp points behind for pickup. :)     #
#                                                          #
# Arguments:                                               #
#   [any] - any argument to the script causes skipping     #
#           sleeping, announcement and countdown.          #
#           Very handy for testing purposes.               #
#                                                          #
############################################################

source env.sh

if [ -z $1 ]; then

    # sleep - Event & Day synch
    sleep $(( $EFFECT_WAIT - 10 ))

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

