#!/bin/bash

############################################################
#                 Event_7_Effect_Speed.sh                  #
#                                                          #
# One random player per team will be faster for a whole    #
# day.                                                     #
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
    echo "EVENT: Schneller!"
    ./announce.sh "Schneller!" green \
                  "Ein Spieler pro Team ist einen Tag lang schneller" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @r[team=$team,m=0] minecraft:speed 1200 2"
done
