#!/bin/sh

#Server connection
SERVER_IP=localhost
PASSWD=YOUR_RCON_PASSWORD
MCRCON_HOME=~/Minecraft/mcrcon

#Spawn and Worldborder
SPAWN_X=0
SPAWN_Y=65 #make sure you don't spawn in a wall or in the air
SPAWN_Z=0

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
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "setworldspawn $SPAWN_X $SPAWN_Y $SPAWN_Z" "clear @a" "give @a minecraft:potato 20" "gamemode 0 @a" "gamerule doDaylightCycle false" "time set 6000" "tp @a $SPAWN_X $SPAWN_Y $SPAWN_Z"
