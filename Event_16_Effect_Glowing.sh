#!/bin/bash

############################################################
#                 Event_16_Effect_Glowing.sh               #
#                                                          #
# All players will glow for 5 minutes                      #
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
    echo "EVENT: Glühwürmchen!"
    ./announce.sh "Glühwürmchen!" red \
                  "Alle Spieler glühen 5 Minuten lang" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @a[team=$team,m=0] minecraft:glowing 300 2"
done
