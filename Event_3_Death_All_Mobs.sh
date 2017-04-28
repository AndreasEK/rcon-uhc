#!/bin/bash

############################################################
#                 Event_3_Death_All_Mobs.sh                #
#                                                          #
# All mobs within a radius of 20 blocks around each player #
# are killed - leaving xp points behind for pickup. :)     #
#                                                          #
# No arguments to the script.                              #
#                                                          #
############################################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Tod den Mobs!"

# show event title and subtitle for 5 seconds
./announce.sh "Tod den Mobs!" green "Alle Mobs im Umkreis von 20 Blöcken um jeden Spieler sterben!" green 5

# countdown 5 seconds
./countdown.sh 5

#
# run the event
#
$RCON_CMD "/execute @a[type=player,m=0] ~ ~ ~ /kill @e[type=!player,r=20]"

