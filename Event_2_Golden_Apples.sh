#!/bin/bash

############################################################
#                 Event_2_Golden_Apples.sh                 #
#                                                          #
# Give one randomly picked player per team a golden apple. #
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
    echo "EVENT: Güldene Äpfel"
    ./announce.sh "Güldene Äpfel" red \
	              "Ein Spieler bekommt einen ziemlich blöden Brustpanzer." white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "give @r[team=$team,m=0] golden_apple"
done
