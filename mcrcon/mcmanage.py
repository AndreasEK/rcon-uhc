#!/usr/local/bin/python3

# On OS X python3 resides in /usr/local/bin

import mcrcon
import time

# python 2 compatibility
try: input = raw_input
except NameError: pass

if __name__ == '__main__':
    import sys

    args = sys.argv[1:]
    if len(args) < 4:
        print("usage: mcmanage.py <host> <port> <password> <command>+")
        sys.exit(1)

    # get host, port and password
    host=args[0]
    port=int(args[1])
    password = args[2]
    # now get the commands in a new array to repeatedly execute
    commands = sys.argv[4:]

    # connect and login
    rcon = mcrcon.MCRcon()
    rcon.connect(host, port)
    rcon.login(password)

    # run all commands
    for cmd in commands:
        response = rcon.command(cmd)
        if response: print("%s" % response)

    # disconnect
    rcon.disconnect()


