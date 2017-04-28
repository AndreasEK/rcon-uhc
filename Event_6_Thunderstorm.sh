#!/bin/bash

#########################################################
#                Event_6_Thunderstorm.sh                #
#                                                       #
# Thunderstorm for a whole day!                         #
#                                                       #
# No arguments to the script.                           #
#                                                       #
#########################################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Gewitter einen Tag lang"

# show event title and subtitle for 5 seconds
./announce.sh "Donnergrollen!" red "Schlechtes Wetter, den ganzen Tag" white 5

# countdown 5 seconds
./countdown.sh 5

#
# run the event
#
$RCON_CMD "weather thunder 20000"
