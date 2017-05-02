#!/bin/bash

############################################################
#                 Event_1_Bad_Armour.sh                    #
#                                                          #
# One randomly selected player will receive a chest        #
# plate with some bad, hampering statistics.               #
#                                                          #
# Arguments:                                               #
#   sleep - Sleeping time in seconds                       #
#   [any] - any argument to the script causes skipping     #
#           sleeping, announcement and countdown.          #
#           Very handy for testing purposes.               #
#                                                          #
############################################################

source env.sh

# parse sleep time parameter
if [ -z $1 ]; then
    sleeptime=$(( EFFECT_WAIT + 20 ))
else
    sleeptime=$1
fi

# short cut for debugging
if [ -z $2 ]; then
    # sleep the configured time
    sleep $sleeptime
    # Announce and countdown
    echo "EVENT: Flip flop!"
    ./announce.sh "Flip flop!" yellow \
                  "Zwei Teams wechseln ihre Positionen..." white 5
    ./countdown.sh 5
fi

#
# Run the event
#
RANDOM=$$$(date +%s) # Seed random generator
# 1. - Filtering live teams
declare -a liveTeams
for team in "${TEAMS[@]}"
do
    teamPlayers=$( $RCON_CMD "scoreboard teams list $team" )
    echo "1. teamplayers=" $teamPlayers
    if [[ $teamPlayers =~ Showing ]]; then
        liveTeams+=( "$team" )
    fi
done
# 2. - Proceed only if 2 or more teams have players
if [ ${#liveTeams[@]} <= 2 ]; then
    echo "Less than 2 teams available, aborting."
    exit 255
fi
# 3. - Select two different teams by random
team_a=""
team_b=""
while [ $team_a = $team_b ]
do
    team_a=${liveTeams[$RANDOM % ${#liveTeams[@]} ]}
    team_b=${liveTeams[$RANDOM % ${#liveTeams[@]} ]}
done
# 4. - Do the swap
# Summon invisible armour stands to team A
$RCON_CMD "execute @p[team=$team_a] ~ ~ ~ summon ArmorStand ~ ~ ~ \
           {Invisible:1,Invulnerable:1,Marker:1,NoGravity:1,NoAI:1,tags=[\"swap_a\"]}"
# Summon invisible armour stand to team B
$RCON_CMD "execute @p[team=$team_b] ~ ~ ~ summon ArmorStand ~ ~ ~ \
           {Invisible:1,Invulnerable:1,Marker:1,NoGravity:1,NoAI:1,tags=[\"swap_b\"]}"
# Swap teams
$RCON_CMD "tp @p[team=$team_a] @p[tag=swap_b]" \
          "tp @p[team=$team_b] @p[tag=swap_a]"
# Remove armour stands
$RCON_CMD "kill @e[tag=swap_a]" \
          "kill @e[tag=swap_b]"

