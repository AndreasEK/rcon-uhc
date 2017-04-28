#!/bin/bash

##############################################
#           Event_7_Effect_Speed.sh          #
#                                            #
# One random player per team will be faster  #
# for a whole day                            #
#                                            #
# No arguments to the script.                #
#                                            #
##############################################

source env.sh

# sleep for the effect wait time minus 10 seconds (for announcement and countdown)
sleep $(( $EFFECT_WAIT - 10 ))

<<<<<<< HEAD
echo "EVENT: Gewitter einen Tag lang"
=======
echo "EVENT: Schneller!"

title=Schneller!
subtitle="Ein Teamspieler ist einen Tag lang schneller"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$title\", \"color\":\"green\"}" "title @a subtitle {\"text\":\"$subtitle\"}"
>>>>>>> master

# show event title and subtitle for 5 seconds
./announce.sh "Schneller!" green "Ein Spieler pro Team ist einen Tag lang schneller" white 5

# countdown 5 seconds
./countdown.sh 5

#
# run the event
#
for team in blue gold green aqua red yellow light_purple dark_blue
do
	$RCON_CMD "effect @r[team=$team,m=0] minecraft:speed 1200 2"
done
