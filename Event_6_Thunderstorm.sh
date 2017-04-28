#!/bin/sh
source env.sh

sleep $(( $EFFECT_WAIT - 10 ))

echo "EVENT: Gewitter"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"Donnergrollen\", \"color\":\"red\"}" "title @a subtitle {\"text\":\"Schlechtes Wetter, den ganzen Tag\"}"

sleep 5

./countdown.sh

$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "weather thunder 20000"
