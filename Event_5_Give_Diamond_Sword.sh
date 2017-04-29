#!/bin/bash

############################################################
#             Event_5_Give_Diamond_Sword.sh                #
#                                                          #
# Give one randomly picked player per team a               #
# diamond sword                                            #
#                                                          #
# Arguments:                                               #
#   sleep - Sleeping time in seconds                       #
#   [any] - any argument to the script causes skipping     #
#           sleeping, announcement and countdown.          #
#           Very handy for testing purposes.               #
#                                                          #
############################################################

source env.sh

# parse sleep time parameter
if [ -z $1 ]; then
    sleeptime=$(( EFFECT_WAIT + 20 ))
else
    sleeptime=$1
fi

# short cut for debugging
if [ -z $2 ]; then
    # sleep the configured time
    sleep $sleeptime
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
