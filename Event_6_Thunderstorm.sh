#!/bin/bash

############################################################
#                Event_6_Thunderstorm.sh                   #
#                                                          #
# Thunderstorm for a whole day!                            #
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
    echo "EVENT: Gewitter einen Tag lang"
    ./announce.sh "Donnergrollen!" red "Schlechtes Wetter, den ganzen Tag" white 5
    ./countdown.sh 5
fi

#
# run the event
#
$RCON_CMD "weather thunder 20000"
