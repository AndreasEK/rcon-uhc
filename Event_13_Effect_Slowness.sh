#!/bin/sh
source env.sh

sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Laaaangsam!"

title=Laaaangsam!
subtitle="Ein Teamspieler ist 5 Minuten lang langsamer"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$title\", \"color\":\"red\"}" "title @a subtitle {\"text\":\"$subtitle\"}"

sleep 5

./countdown.sh

for team in blue gold green aqua red yellow light_purple dark_blue
do
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "effect @r[team=$team,m=0] minecraft:slowness 300 2"
done
