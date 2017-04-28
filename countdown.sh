#!/bin/bash

#########################################################
#                       countdown.sh                    #
#                                                       #
# Runs a countdown timer on the server.                 #
#                                                       #
# Arguments - for now all arguments are mandatory:      #
#   numseconds - Number of seconds to count down        #
#                                                       #
#########################################################

source env.sh

#
# TODO - proper check of command line arguments
#
if [ $# -ne 1 ] 
then
	echo "Usage: countdown.sh <numseconds>"
	exit 255
fi

#COUNTDOWN
# Reset & configure event display times 
$RCON_CMD "title @a reset"
$RCON_CMD "title @a times 0 20 0"

#counting down
for ((countdown = $1; countdown>= 1; countdown--))
do
  $RCON_CMD "title @a title {\"text\":\"$countdown\"}"
  sleep 1
done

# reset display times again - be a well-behaved citizen ;-)
$RCON_CMD "title @a reset"

