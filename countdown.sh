#!/bin/sh

#########################################################
#               event_announce.sh					    #
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
# TODO - proper check of command line arguments
#
if [ $# -ne 5 ] then
	echo "Usage: event_announce.sh title colour subtitle colour displaytime"
	exit 255
fi

#
# Configure event display times 
#
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a times 0 20 0"

#
# Get on with the event announcement
#

echo "EVENT: Schneller!"

title=Schneller!
subtitle="Ein Spieler ist einen Tag lang schneller"
$MCRCON_HOME/mcrcon -H $SERVER_IP -p $PASSWD "title @a title {\"text\":\"$title\", \"color\":\"green\"}" "title @a subtitle {\"text\":\"$subtitle\"}"

sleep 5

./countdown.sh


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

