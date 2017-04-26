#!/bin/sh

source env.sh

$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "gamerule sendCommandFeedback false"
for team in blue gold green aqua red yellow light_purple dark_blue
do
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "scoreboard teams add $team" "scoreboard teams option $team color $team" "scoreboard teams empty $team" "scoreboard teams option $team friendlyfire true" "scoreboard teams option $team nametagVisibility hideForOwnTeam" "scoreboard teams option $team collisionRule always"
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "tellraw @a [ \
	{\"text\":\"Team beitreten: \"}, \
	{\"text\":\"$team \", \
	 \"color\":\"$team\", \
	 \"clickEvent\": { \"action\":\"run_command\", \
	                   \"value\":\"/scoreboard teams join $team\"} \
	}]"
done
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "scoreboard objectives add herzen health" "scoreboard objectives setdisplay list herzen" "effect @a minecraft:instant_health"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "spreadplayers $SPAWN_X $SPAWN_Z 5 20 true @a"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "clear @a" "give @a minecraft:potato 20" "gamemode 0 @a" "gamerule doDaylightCycle false" "gamerule keepInventory false" "time set 6000"
