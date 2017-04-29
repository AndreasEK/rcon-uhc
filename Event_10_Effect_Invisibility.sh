#!/bin/bash

############################################################
#               Event_10_Effect_Invisibility.sh            #
#                                                          #
# All players will be invisible for 10 minutes.            #
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
    echo "EVENT: Unsichtbarkeit!"
    ./announce.sh "Huch!" yellow \
                  "Alle Spieler sind 10 Minuten unsichtbar" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @a[team=$team,m=0] minecraft:invisibility 600 2"
done
