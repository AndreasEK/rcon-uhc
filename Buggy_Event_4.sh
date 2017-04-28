#!/bin/sh
source env.sh

sleep $EFFECT_WAIT

echo "EVENT: Flip flop!"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Flip flop!\", \"color\":\"red\"}" "title @a subtitle {\"text\":\"Zwei Teams wechseln ihre Positionen...\"}"

sleep $EFFECT_WAIT

#
# Teams zufsallig auswaehlen
#
teams=(blue gold green aqua red yellow light_purple dark_blue)
RANDOM=$$$(date +%s) # Seed random generator

team_a=""
team_b=""
# randomly select _different_ teams
while [ $team_a = $team_b ]
do
    team_a=${teams[$RANDOM % ${#teams[@]} ]}
    team_b=${teams[$RANDOM % ${#teams[@]} ]}
done

# Summon invisible armour stand to team A
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "execute @p[team=$team_a] ~ ~ ~ summon ArmorStand ~ ~ ~ {Invisible:1,Invulnerable:1,Marker:1,NoGravity:1,NoAI:1,tags=[\"swap\"]}"

# Teleport team A to team B (armour stand stays at team A's position)
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "tp @p[team=$team_a] @p[team=$team_b]"

# Now teleport team B to armour stand (at team A's former position)
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "tp @p[team=$team_b] @p[tag=swap]"

# Remove armour stand
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "kill @e[tag=swap]"

