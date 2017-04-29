#!/bin/bash

############################################################
#                Event_6_Thunderstorm.sh                   #
#                                                          #
# Thunderstorm for a whole day!                            #
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
    echo "EVENT: Gewitter einen Tag lang"
    ./announce.sh "Donnergrollen!" red "Schlechtes Wetter, den ganzen Tag" white 5
    ./countdown.sh 5

fi

#
# run the event
#
$RCON_CMD "weather thunder 20000"
