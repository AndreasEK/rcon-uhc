#!/bin/sh

source env.sh

#COUNTDOWN
#configure titles to show only for one second
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a times 0 0 20"
for countdown in {5..1}
do
  $MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$countdown\"}"
  sleep 1
done
#reset title to default lengths
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a reset"

