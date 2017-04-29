#!/bin/bash

############################################################
#                 Event_14_Effect_Nausea.sh                #
#                                                          #
# One random player per team will feel nauseous for 5      #
# minutes.                                                 #
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
