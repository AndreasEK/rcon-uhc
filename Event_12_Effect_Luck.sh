#!/bin/sh
source env.sh

sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Glück!"

title=Glück!
subtitle="Ein Teamspieler hat einen Tag lang Glück"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$title\", \"color\":\"green\"}" "title @a subtitle {\"text\":\"$subtitle\"}"

sleep 5

./countdown.sh

for team in blue gold green aqua red yellow light_purple dark_blue
do
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "effect @r[team=$team,m=0] minecraft:luck 1200 2"
done
