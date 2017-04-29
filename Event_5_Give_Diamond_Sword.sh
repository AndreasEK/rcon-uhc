#!/bin/bash

############################################################
#             Event_5_Give_Diamond_Sword.sh                #
#                                                          #
# Give one randomly picked player per team a               #
# diamond sword                                            #
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
    echo "EVENT: Ein Diamantschwert"
    ./announce.sh "Bling Bling!" green \
                  "Ein Diamantschwert für einen Spieler pro Team" white 5
    ./countdown.sh 5

fi

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "give @r[team=$team,m=0] diamond_sword"
done
