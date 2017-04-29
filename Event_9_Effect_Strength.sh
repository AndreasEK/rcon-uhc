#!/bin/bash

############################################################
#                 Event_9_Effect_Strength.sh               #
#                                                          #
# One random player per team will be stronger for a whole  #
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
    echo "EVENT: Stark!"
    ./announce.sh "Stark!" green \
                  "Ein Teamspieler ist einen Tag ganz stark." white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @r[team=$team,m=0] minecraft:strength 1200 2"
done
