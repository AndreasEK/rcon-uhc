#!/bin/bash

############################################################
#               Event_11_Effect_Nightvision.sh             #
#                                                          #
# All players will have night vision for a whole day.      #
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
    echo "EVENT: Nachtsicht!"
    ./announce.sh "Nachtsicht!" green \
                  "Alle Spieler können im Dunkeln sehen" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "effect @a[team=$team,m=0] minecraft:night_vision 1200 2"
done
