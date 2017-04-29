#!/bin/bash

############################################################
#                Event_13_Effect_Slowness.sh               #
#                                                          #
# One random player per team will be slow for 5 minutes.   #
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
    echo "EVENT: Laaaangsam!"
    ./announce.sh "Laaaangsam!" red \
                  "Ein Teamspieler ist 5 Minuten lang langsamer" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @r[team=$team,m=0] minecraft:slowness 300 2"
done
