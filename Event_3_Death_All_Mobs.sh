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

echo "EVENT: Tod den Mobs!"

# show event title and subtitle for 5 seconds
title="Tod den Mobs!"
subtitle="Alle Mobs im Umkreis von 20 Blöcken um jeden Spieler sterben!"
./announce.sh "$title" green "$subtitle" green 5

# countdown 5 seconds
./countdown.sh 5

$RCON_CMD "/execute @a[type=player,m=0] ~ ~ ~ /kill @e[type=!player,r=20]"

