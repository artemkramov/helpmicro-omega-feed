#!/bin/sh

# include the Onion sh lib
. /usr/lib/onion/lib.sh

case "$1" in
   list)
        echo '{"state": {}, "power": {}}'
   ;;
   call)
        case "$2" in
                state)
                        # return json object or an array
                        /usr/bin/pybluez/get-adapter-state
                ;;
                power)
			# read the arguments
			read input;
			
			json_load "$input"
			json_get_var "state" "state"
			/usr/bin/pybluez/set-adapter-state "$state"	
                ;;
        esac
   ;;
esac

