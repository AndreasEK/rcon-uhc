#!/bin/bash

#########################################################
#                  Event_4_Give_Bow.sh                  #
#                                                       #
# Give one randomly picked player per team a bow.       #
#                                                       #
# No arguments to the script.                           #
#                                                       #
#########################################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Ein Bogen!"

# show event title and subtitle for 5 seconds
./announce.sh "Ein Bogen" green "Ein Bogen für einen Spieler pro Team" green 5

# countdown 5 seconds
./countdown.sh 5

#
# run the event
#
for team in $TEAMS
do
	$RCON_CMD "give @r[team=$team,m=0] bow"
done
