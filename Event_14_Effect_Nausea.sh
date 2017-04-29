#!/bin/bash

############################################################
#                 Event_14_Effect_Nausea.sh                #
#                                                          #
# One random player per team will feel nauseous for 5      #
# minutes.                                                 #
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
    echo "EVENT: Örks!"
    ./announce.sh "Örks!" red \
                  "Einem Teamspieler ist 5 Minuten lang schwindelig" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @r[team=$team,m=0] minecraft:nausea 300 2"
done
