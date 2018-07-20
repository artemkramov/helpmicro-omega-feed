#!/bin/sh

# include the Onion sh lib
. /usr/lib/onion/lib.sh

case "$1" in
   list)
        echo '{"state": {}, "power": {}, "scan": {}, "pair": {}, "connect": {}, "disconnect": {}, "remove": {}}'
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
		scan)
			/usr/bin/pybluez/scan-devices
		;;
		pair)
			read input;
			json_load "$input"
			json_get_var "address" "address"
			/usr/bin/pybluez/pair "$address"
		;;
		connect)
			read input;
			json_load "$input"
			json_get_var "address" "address"
			/usr/bin/pybluez/connect-to-network "$address"
		;;
		disconnect)
			read input;
			json_load "$input"
			json_get_var "address" "address"
			/usr/bin/pybluez/connect-to-network "$address" 1
		;;
		remove)
			read input;
			json_load "$input"
			json_get_var "address" "address"
			/usr/bin/pybluez/remove-device "$address"
		;;
        esac
   ;;
esac

