#!/bin/sh
source env.sh

sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Nachtsicht!"

title=Nachtsicht!
subtitle="Alle Spieler können im Dunklen sehen"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$title\", \"color\":\"green\"}" "title @a subtitle {\"text\":\"$subtitle\"}"

sleep 5

./countdown.sh

for team in blue gold green aqua red yellow light_purple dark_blue
do
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "effect @a[team=$team,m=0] minecraft:night_vision 1200 2"
done
