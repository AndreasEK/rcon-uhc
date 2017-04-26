#!/bin/sh
source env.sh

sleep $EFFECT_WAIT

echo "EVENT: Bad Armour"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Bad Armour\", \"color\":\"red\"}" "title @a subtitle {\"text\":\"Ein Spieler bekommt einen ziemlich blöden Brustpanzer.\"}"

# Gibt einem Spieler eine verwunschene und recht stark abgenutze Diamant-Brustplate,
# die nicht abgelegt werden kann (curse of binding) und bei Tod verschwindet
# (curse of vanishing).
# Diese Ruestung limitiert die maximalen hitpoints auf 7 Herzen, so lange sie getragen wird, und nicht durch Tod oder Abnutzung zerstoert wird.
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "/replaceitem entity @r slot.armor.chest minecraft:diamond_chestplate 1 500 {display:{Name:\"Chest plate of weakness\"}, ench:[{id:10, lvl:1},{id:71, lvl:1}], AttributeModifiers:[{AttributeName:generic.maxHealth, Name:egal, Amount:-6, Operation:0, UUIDMost:3, UUIDLeast:3, Slot:chest}]}"
