#!/bin/sh
source env.sh

# Gibt einem Spieler eine verwunschene und recht stark abgenutze Diamant-Brustplate,
# die nicht abgelegt werden kann (curse of binding) und bei Tod verschwindet
# (curse of vanishing).
# Diese Ruestung limitiert die maximalen hitpoints auf 7 Herzen, so lange sie getragen wird, und nicht durch Tod oder Abnutzung zerstoert wird.
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "/replaceitem entity @p slot.armor.chest minecraft:diamond_chestplate 1 500 {display:{Name:\"Chest plate of weakness\"}, ench:[{id:10, lvl:1},{id:71, lvl:1}], AttributeModifiers:[{AttributeName:generic.maxHealth, Name:egal, Amount:-6, Operation:0, UUIDMost:3, UUIDLeast:3, Slot:chest}]}"

echo "EVENT 1 IS RUNNING"
sleep $EFFECT_WAIT
