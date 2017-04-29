#!/bin/bash

############################################################
#                    Event_4_Give_Bow.sh                   #
#                                                          #
# Give one randomly picked player per team a bow.          #
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
    echo "EVENT: Ein Bogen!"
    ./announce.sh "Ein Bogen" green "Ein Bogen für einen Spieler pro Team" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "give @r[team=$team,m=0] bow"
done
