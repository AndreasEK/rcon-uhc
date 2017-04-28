#!/bin/sh
source env.sh

sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Güldene Äpfel"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Güldene Äpfel\", \"color\":\"yellow\"}" "title @a subtitle {\"text\":\"Ein goldener Apfel für einen Spieler pro Team\"}"

sleep 5

./countdown.sh

for team in blue gold green aqua red yellow light_purple dark_blue
do
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "give @r[team=$team,m=0] golden_apple"
done
