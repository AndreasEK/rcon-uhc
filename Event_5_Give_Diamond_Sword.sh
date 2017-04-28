#!/bin/bash

#########################################################
#             Event_5_Give_Diamond_Sword.sh             #
#                                                       #
# Give one randomly picked player per team a            #
# diamond sword                                         #
#                                                       #
# No arguments to the script.                           #
#                                                       #
#########################################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
sleep $(( $EFFECT_WAIT - 10 ))

<<<<<<< HEAD
echo "EVENT: Diamantschwert"
=======
echo "EVENT: Ein Diamantschwert"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Bling Bling\", \"color\":\"green\"}" "title @a subtitle {\"text\":\"Ein Diamantschwert für einen Spieler pro Team\"}"
>>>>>>> master

# show event title and subtitle for 5 seconds
./announce.sh "Bling Bling!" green "Ein Diamantschwert für einen Spieler pro Team" white 5

# countdown 5 seconds
./countdown.sh 5

#
# run the event
#
for team in blue gold green aqua red yellow light_purple dark_blue
do
	$RCON_CMD "give @r[team=$team,m=0] diamond_sword"
done
