#!/bin/bash

#########################################################
#                 Event_1_Bad_Armour.sh                 #
#                                                       #
# One randomly selected player will receive a chest     #
# plate with some bad, hampering statistics.            #
#                                                       #
# No arguments to the script.                           #
#                                                       #
#########################################################

source env.sh
if [ -z $1 ]; then
    # sleep for the effect wait time minus 10 seconds (for announcement and countdown)
    sleep $(( $EFFECT_WAIT - 10 ))
fi

echo "EVENT: Bad Armour"

# show event title and subtitle for 5 seconds
./announce.sh "Fiese Rüstung" red \
              "Ein Spieler bekommt einen ziemlich blöden Brustpanzer." white 5

# countdown 5 seconds
./countdown.sh 5

#
# run the event
#
$RCON_CMD "replaceitem entity @r[m=0] slot.armor.chest minecraft:diamond_chestplate 1 500 \
{display:{Name:\"Chest plate of weakness\"}, ench:[{id:10, lvl:1},{id:71, lvl:1}], \
AttributeModifiers:[{AttributeName:generic.maxHealth, Name:egal, Amount:-6, Operation:0, \
UUIDMost:3, UUIDLeast:3, Slot:chest}]}"

