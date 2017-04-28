#!/bin/bash

############################################################
#                 Event_2_Golden_Apples.sh                 #
#                                                          #
# Give one randomly picked player per team a golden apple. #
# plate with some bad, hampering statistics.               #
#                                                          #
# No arguments to the script.                              #
#                                                          #
############################################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Güldene Äpfel"

# show event title and subtitle for 5 seconds
title="Güldene Äpfel"
subtitle="Ein goldener Apfel für einen Spieler pro Team"
./announce.sh "$title" yellow "$subtitle" yellow 5

# countdown 5 seconds
./countdown.sh 5

# run the event
for team in $TEAMS
do
	$RCON_CMD "give @r[team=$team,m=0] golden_apple"
done
