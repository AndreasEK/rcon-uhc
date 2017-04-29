#!/bin/bash

############################################################
#                Event_15_Effect_Blindness.sh              #
#                                                          #
# One random player per team will be blind for 5 minutes.  #
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
    echo "EVENT: Blinde Kuh!"
    ./announce.sh "Blinde Kuh!" red \
                  "Ein Teamspieler ist 5 Minuten lang blind" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @r[team=$team,m=0] minecraft:blindness 300 2"
done
