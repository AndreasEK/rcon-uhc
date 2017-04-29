#!/bin/bash

############################################################
#                     Prepare_UHC.sh                       #
#                                                          #
# Prepares the game world so that an UHC event can be run  #
# as follows.                                              #
#                                                          #
############################################################

source env.sh

#
# General rule configurations
# 
$RCON_CMD "gamerule sendCommandFeedback false" # no command feedback

#
# Prepare teams, and invite players to join them
#
for team in $TEAMS
do
	# configure teams
	$RCON_CMD "scoreboard teams add $team" \
	          "scoreboard teams option $team color $team" \
	          "scoreboard teams empty $team" \
	          "scoreboard teams option $team friendlyfire true" \
	          "scoreboard teams option $team nametagVisibility hideForOwnTeam" \
	          "scoreboard teams option $team collisionRule always"
	# invite players
	$RCON_CMD "tellraw @a [ \
                  {\"text\":\"Team beitreten: \"}, \
                  {\"text\":\"$team \",\"color\":\"$team\", \
                      \"clickEvent\": {\"action\":\"run_command\", \
                                       \"value\":\"/scoreboard teams join $team\"} \
                  }]"
done

#
# Prepare scoreboard and players
#
# Scoreboard will display all players' healthbars
$RCON_CMD "scoreboard objectives add herzen health" \
          "scoreboard objectives setdisplay list herzen" \
          "effect @a minecraft:instant_health"
# Assemble players around spawnpoint
$RCON_CMD "spreadplayers $SPAWN_X $SPAWN_Z 5 20 true @a"
# Strip players from any belongings (and keep it that way), except for 20 potatoes
# set all players to survival mode, and configure in-game time
$RCON_CMD "gamemode 0 @a" \
          "clear @a" "give @a minecraft:potato 20" "gamerule keepInventory false" \
           "gamerule doDaylightCycle false" "time set 6000"
