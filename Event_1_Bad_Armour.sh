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
    echo "EVENT: Bad Armour"
    ./announce.sh "Fiese Rüstung" red \
                  "Ein Spieler bekommt einen ziemlich blöden Brustpanzer." white 5
    ./countdown.sh 5
fi

#
# run the event
#
$RCON_CMD "replaceitem entity @r[m=0] \
slot.armor.chest minecraft:diamond_chestplate 1 500 \
{display:{Name:\"Chest plate of weakness\"}, \
ench:[{id:10, lvl:1},{id:71, lvl:1}], \
AttributeModifiers:[{AttributeName:generic.maxHealth, Name:egal, Amount:-6, Operation:0, \
UUIDMost:3, UUIDLeast:3, Slot:chest}]}"

