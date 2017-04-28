#!/bin/bash

#########################################################
#                     announce.sh					    #
#													    #
# Announces an event with the given title and subtitle  #
# in the given respective colours, for the given time   #
# in seconds.										    #
#													    #
# Arguments - for now all arguments are mandatory:	    #
#	title			- title								#
#	titlecolour		- title colour						#
#	subtitle 		- subtitle							#
#	subtitlecolour	- subtitle colour					#
#	display time	- display time						#
#########################################################

source env.sh

#
# Basic command line arguments check
#
if [ $# -ne 5 ]
then
	echo "Usage: announce.sh title colour subtitle colour displaytime"
	exit 255
fi
#
# TODO - proper check of command line arguments
#

# Reset & configure event display times 
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a reset"
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a times 0 ($5*20) 0"

# display title and subtitle 
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a title {\"text\":\"$1\", \"color\":\"$2\"}" "title @a subtitle {\"text\":\"$3\",\"color\":\"$4\"}"
sleep $5

# reset display times again - be a well-behaved citizen ;-)
$PY_MCRCON $SERVER_IP $RCON_PORT $PASSWD "title @a reset"

