#!/bin/bash

#########################################################
#               	countdown.sh                        #
#                                                       #
# Runs a countdown timer on the server.                 #
#                                                       #
# Arguments - for now all arguments are mandatory:      #
#	numseconds - Number of seconds to count down        #
#                                                       #
#########################################################

source env.sh

#
# TODO - proper check of command line arguments
#
if [ $# -ne 1 ] then
	echo "Usage: countdown.sh <numseconds>"
	exit 255
fi

echo $RCON_CMD 
exit 0

#COUNTDOWN
# Reset & configure event display times 
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a reset"
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a times 0 ($1*20) 0"

#counting down
for countdown in {$1..1}
do
  $RCON_CMD "title @a title {\"text\":\"$countdown\"}"
  sleep 1
done

# reset display times again - be a well-behaved citizen ;-)
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a reset"

