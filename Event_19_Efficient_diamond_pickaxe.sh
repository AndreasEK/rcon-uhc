#!/bin/bash

############################################################
#         Event_19_Efficient_diamond_pickaxe.sh            #
#                                                          #
# Give one randomly picked player per team a diamond       #
# pickaxe for 5 minutes, then remove it again.             #
#                                                          #
# Arguments:                                               #
#   sleep - Sleeping time in seconds                       #
#   [any] - any argument to the script causes skipping     #
#           sleeping, announcement and countdown.          #
#           Very handy for testing purposes.               #
#                                                          #
############################################################

source env.sh

#
# FUNCTION egg_timer - kills items summoned with a unique tag
#
egg_timer() {
	echo "Waiting for $1 seconds before removing items..."
	sleep $1
	$RCON_CMD "kill @e[tag=\"$2\"]"
}

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
    echo "EVENT: Eine effiziente Spitzhacke"
    ./announce.sh "Dig this!" green \
                  "Pro Team eine Efficiency V Spitzhacke!" white 5
    ./countdown.sh 5
fi

#
# run the event
#
# unique tag for the pickaxes
tag=`date +%s`
for team in $TEAMS
do
	$RCON_CMD "give @r[team=$team,m=0] diamond_pickaxe \
	{display:{Name:\"5-Minuten-Spitzhacke\"}, ench:[{id:32, lvl:5}], tags=[\"$tag\"]}}"
done
# run the egg timer function to delete the pickaxes again
egg_timer 500 $tag &