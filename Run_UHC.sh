#!/bin/bash

############################################################
#                       Run_UHC.sh                         #
#                                                          #
# Actually run the UHC, with episodes, world border,       #
# events, and all.                                         #
#                                                          #
############################################################

source env.sh

############################################################
#                         FUNCTIONS                        #
############################################################

#
# FUNCTION housekeeping - regular tasks run in the background until killed
#
housekeeping() {
	# All players with a dead count must be spectators
    $RCON_CMD "/gamemode 3 @p[score_Spectate_min=1,m=!3]"
    # 
    # add more housekeeping here
    # 
    # sleep 20 seconds
    sleep 20
}

#
# FUNCTION start_shrinking - configure world border to start shrinking
#
start_shrinking() {
    # Re-configure world
    echo "WORLD STARTS SHRINKING"
    duration=$(( ($NUMBER_OF_EPISODES - $SHRINK_AT_EPISODE + 1) * $EPISODE_LENGTH_MIN ))
    echo "shrinking border for $duration minutes"
    $RCON_CMD "worldborder set 20 $(( $duration * $SECS_PER_MIN ))"       
    # wait before telling the players
    sleep $EFFECT_WAIT
    ./announce.sh "DIE WELT WIRD KLEINER" white \
                  "Auf ${WORLDBORDER_END}x${WORLDBORDER_END} in $(( $duration )) Minuten." white 5
}

#
# FUNCTION high_noon - HIGH NOON; stays day for the rest of the episodes
#
high_noon() {
    echo "HIGH NOON"
    # Re-configure world
    clear_weather_min=$(( ($NUMBER_OF_EPISODES - $NOON_AT_EPISODE + 1) * $EPISODE_LENGTH_MIN ))
    echo "clearing weather for $clear_weather_min minutes"
    $RCON_CMD "gamerule doDaylightCycle false" "time set 6000" \
              "weather clear $(( $clear_weather_min * $SECS_PER_MIN ))" 
    # wait before telling the players
    sleep $EFFECT_WAIT
    ./announce.sh "HIGH NOON" white \
                  "Ab jetzt ist es immer 12 Uhr mittags!" white 5
}

############################################################
#                           MAIN                           #
############################################################

# 
# Events preparation
# 
number_of_events=`ls -Ub1 | grep ^Event_ | wc -l`
# start housekeeping
housekeeping &
housekeeping_pid=$!

#
# PHASE 1 - INTRO.
# Set world boarder, spread players, and do intro phase configuration.
#
$RCON_CMD "title @a subtitle {\"text\":\"Zeit für das Intro\"}" \
          "title @a title {\"text\":\"Start in $INTRO_LENGTH_MIN Minuten\"}" \
          "worldborder center $SPAWN_X $SPAWN_Z" "worldborder set $WORLDBORDER_START" \
         "spreadplayers $SPAWN_X $SPAWN_Z 100 $(($WORLDBORDER_START / 2 - 100)) true @a" \
          "effect @a minecraft:instant_health 5"
sleep $(($INTRO_LENGTH_MIN * $SECS_PER_MIN)) # Give live streamers time to intro

#
# Set up game world for the actual UHC, and countdown
#
$RCON_CMD "gamerule naturalRegeneration false" \
          "effect @a minecraft:instant_health 5" \
          "gamemode 0 @a" \
          "gamerule doDaylightCycle true" \
          "clear @a" \
          "time set 23500" \
          "scoreboard objectives add Spectate deathCount" \
          "/scoreboard players set @a Spectate 0"


./countdown.sh 5

#
# PHASE 2 - EPISODES
#
for episode in $(seq $FIRST_EPISODE $NUMBER_OF_EPISODES)
do

    # 1. - Announce episode
    echo "Episode $episode"
    $RCON_CMD "title @a title {\"text\":\"$EPISODE_NAME $episode\"}"
    if [ $episode -ne 1 ]; then
       $RCON_CMD "title @a subtitle {\"text\":\"$(($EPISODE_LENGTH_MIN * ( $episode - 1) )) Minuten\"}"
    fi

	# 2. - Fire off border shrinking, or high noon in the background    
    if [ $episode -eq $SHRINK_AT_EPISODE ]; then
    	start_shrinking & # world border starts shrinking
    elif [ $episode -eq $NOON_AT_EPISODE ]; then
    	high_noon & # high noon!
    fi

    # 3. - Run a random event - also in the background
    event=$(( $RANDOM % $number_of_events + 1 ))
    echo "Now running: Event "$event
    /bin/bash "./Event_"$event"*.sh" &

    # 4. - Wait (sleep) until it is time for the next episode
    sleep $EPISODE_LENGTH_MIN
        
done

# UHC done, kill the background housekeeping thread
kill $housekeeping_pid