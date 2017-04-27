#!/bin/sh
source env.sh

sleep $EFFECT_WAIT

echo "EVENT: Güldene Äpfel"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Güldene Äpfel\", \"color\":\"yellow\"}" "title @a subtitle {\"text\":\"Ein goldener Apfel für einen Spieler pro Team\"}"

sleep $EFFECT_WAIT

# Gibt einem Spieler eine verwunschene und recht stark abgenutze Diamant-Brustplate,
# die nicht abgelegt werden kann (curse of binding) und bei Tod verschwindet
# (curse of vanishing).
# Diese Ruestung limitiert die maximalen hitpoints auf 7 Herzen, so lange sie getragen wird, und nicht durch Tod oder Abnutzung zerstoert wird.
for team in blue gold green aqua red yellow light_purple dark_blue
do
	$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "give @r[team=$team] golden_apple"
done
