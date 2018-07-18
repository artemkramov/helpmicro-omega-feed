#!/bin/sh

case "$1" in
   list)
        echo '{"state": {}, "toto": {}}'
   ;;
   call)
        case "$2" in
                state)
                        # return json object or an array
                        /usr/bin/pybluez/get-adapter-state
                ;;
                toto)
                        # return json object or an array
                        echo '{}'
                ;;
        esac
   ;;
esac

