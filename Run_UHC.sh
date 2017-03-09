#!/bin/sh

#Server connection
SERVER_IP=localhost
PASSWD=YOUR_RCON_PASSWORD
MCRCON_HOME=~/Minecraft/mcrcon

#Spawn and Worldborder
SPAWN_X=0
SPAWN_Y=75 #make sure you don't spawn in a wall or in the air
SPAWN_Z=0
WORLDBORDER_START=1500
WORLDBORDER_END=20

#Timings & Events
INTRO_LENGTH_MIN=1
EPISODE_LENGTH_MIN=20
NUMBER_OF_EPISODES=10
SHRINK_AT_EPISODE=5
NOON_AT_EPISODE=9


#just for debugging
SECS_PER_MIN=60
EFFECT_WAIT=30

#INTRO - SET WORLD BORDER - SPREAD PLAYERS
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"Zeit für das Intro\"}" "title @a title {\"text\":\"Start in $INTRO_LENGTH_MIN Minuten\"}" "worldborder center $SPAWN_X $SPAWN_Z" "worldborder set $WORLDBORDER_START" "spreadplayers $SPAWN_X $SPAWN_Z 100 $(($WORLDBORDER_START / 2 - 100)) true @a" "effect @a minecraft:instant_health 5"
sleep $(($INTRO_LENGTH_MIN * $SECS_PER_MIN))

#SETUP THE GAME
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "gamerule naturalRegeneration false" "effect @a minecraft:instant_health 5" "gamemode 0 @a" "gamerule doDaylightCycle true" "time set 23500" "clear @a"

#COUNTDOWN
#configure titles to show only for one second
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a times 0 0 20"
for countdown in {5..1}
do
  $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$countdown\"}"
  sleep 1
done
#reset title to default lengths
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a reset"

#EPISODE MARKERS
for episode in $(seq 1 $NUMBER_OF_EPISODES)
do
   echo "Episode $episode"
   $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"EPISODE $episode\"}"
   if [ $episode -ne 1 ]
   then
      $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * ( $episode - 1) )) Minuten\"}"
   fi

   episode_effect_wait=0
   #Shrink border
   if [ $episode -eq $SHRINK_AT_EPISODE ]
   then
      echo "WORLD SHRINKS"
      #apply effect
      worldborder_shrink_min=$(( ($NUMBER_OF_EPISODES - $SHRINK_AT_EPISODE + 1) * $EPISODE_LENGTH_MIN ))
      echo "shrinking border for $worldborder_shrink_min minutes"
      $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "worldborder set 20 $(( $worldborder_shrink_min * $SECS_PER_MIN ))" 
      
      #wait a little to update title to players
      episode_effect_wait=$EFFECT_WAIT
      sleep $EFFECT_WAIT
      $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"Auf ${WORLDBORDER_END}x${WORLDBORDER_END} in $(( $worldborder_shrink_min )) Minuten.\"}" "title @a title {\"text\":\"DIE WELT WIRD KLEINER\"}"
   fi
   
   #High Noon
   if [ $episode -eq $NOON_AT_EPISODE ]
   then
      echo "HIGH NOON"
      #apply effect
      clear_weather_min=$(( ($NUMBER_OF_EPISODES - $NOON_AT_EPISODE + 1) * $EPISODE_LENGTH_MIN ))
      echo "clearing weather for $clear_weather_min minutes"
      $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "gamerule doDaylightCycle false" "time set 6000" "weather clear $(( $clear_weather_min * $SECS_PER_MIN ))" 
      
      #wait a little to update title to players
      episode_effect_wait=$EFFECT_WAIT
      sleep $EFFECT_WAIT
      $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a subtitle {\"text\":\"Ab jetzt ist es immer 12 Uhr mittags!\"}" "title @a title {\"text\":\"HIGH NOON\"}"
   fi
   
   sleep $(($EPISODE_LENGTH_MIN * $SECS_PER_MIN - $episode_effect_wait)) 
done
