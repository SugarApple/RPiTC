#! /bin/bash

case "$1" in
      start)
            read -n1 -s -t 3 -p "Press secret key to enter admin mode:" ans
            case "$ans" in
              [K]|[K])
                /usr/bin/clear_console -q
                echo "Entering Admin mode!"
                touch /tmp/usermode_root
                ;;

              [B]|[B])
                /usr/bin/clear_console -q
                echo "Browser mode"
                touch /tmp/usermode_browser
                ;;
              *)
                /usr/bin/clear_console -q
                echo "Entering user mode"
                touch /tmp/usermode_rpitc
                ;;
            esac
            ;;
      stop)
            /usr/bin/clear_console -q
            /usr/bin/h264 /opt/ENDING.m4v &
            echo "setting back to user profile"
            ;;
esac
exit 0
