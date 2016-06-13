#!/bin/sh
export SERVER_IP=localhost
export PASSWD=YOUR_RCON_PASSWORD
export SPAWN_X=0
#make sure you don't spawn in a wall or in the air
export SPAWN_Y=65 
export SPAWN_Z=0
export INTRO_LENGTH_MIN=3
export EPISODE_LENGTH_MIN=20
export MCRCON_HOME=~/Minecraft/mcrcon
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"Zeit für das Intro\"}" "title @a title {\"text\":\"Start in $INTRO_LENGTH_MIN Minute(n)\"}" "worldborder center $SPAWN_X $SPAWN_Z" "worldborder set 1500" "spreadplayers $SPAWN_X $SPAWN_Z 100 650 true @a" "effect @a minecraft:instant_health 5"
sleep $(($INTRO_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "gamerule naturalRegeneration false" "effect @a minecraft:instant_health 5" "gamemode 0 @a" "gamerule doDaylightCycle true" "time set 23500" "clear @a"
#configure titles to show only for one second
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a times 0 0 20"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"5\"}"
sleep 1
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"4\"}"
sleep 1
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"3\"}"
sleep 1
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"2\"}"
sleep 1
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"1\"}"
sleep 1
#reset title to default lengths
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a reset"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"EPISODE 1\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$EPISODE_LENGTH_MIN Minuten\"}" "title @a title {\"text\":\"EPISODE 2\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 2)) Minuten\"}" "title @a title {\"text\":\"EPISODE 3\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 3)) Minuten\"}" "title @a title {\"text\":\"EPISODE 4\"}"
sleep 30
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "worldborder set 20 3600" "title @a subtitle {\"text\":\"Auf 20x20 in einer Stunde.\"}" "title @a title {\"text\":\"DIE WELT WIRD KLEINER\"}"
sleep $(($EPISODE_LENGTH_MIN * 60 - 30))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 4)) Minuten\"}" "title @a title {\"text\":\"EPISODE 5\"}"
sleep $EPISODE_LENGTH
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 5)) Minuten\"}" "title @a title {\"text\":\"EPISODE 6\"}"
sleep 30
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "gamerule doDaylightCycle false" "time set 6000" "title @a subtitle {\"text\":\"Ab jetzt ist es immer 12 Uhr mittags!\"}" "title @a title {\"text\":\"HIGH NOON\"}"
sleep $(($EPISODE_LENGTH_MIN * 60 - 30))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 6)) Minuten\"}" "title @a title {\"text\":\"EPISODE 7\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 7)) Minuten\"}" "title @a title {\"text\":\"EPISODE 8\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 8)) Minuten\"}" "title @a title {\"text\":\"EPISODE 9\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 9)) Minuten\"}" "title @a title {\"text\":\"EPISODE 10\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 10)) Minuten\"}" "title @a title {\"text\":\"EPISODE 11\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 11)) Minuten\"}" "title @a title {\"text\":\"EPISODE 12\"}"
sleep $(($EPISODE_LENGTH_MIN * 60))
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * 12)) Minuten\"}" "title @a title {\"text\":\"EPISODE 13\"}"
