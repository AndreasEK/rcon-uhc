#!/bin/sh
source env.sh

sleep $EFFECT_WAIT

echo "EVENT: Tod den Mobs"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Tod den Mobs\", \"color\":\"green\"}" "title @a subtitle {\"text\":\"Alle Mobs im Umkreis von 20 Blöcken um jeden Spieler sterben.\"}"

$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "/execute @a[type=player,m=0] ~ ~ ~ /kill @e[type=!player,r=20]"

