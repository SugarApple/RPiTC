export LD_LIBRARY_PATH="/usr/local/lib/;/usr/local/lib/arm-linux-gnueabi/"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec startx >/dev/null 2>&1
fi


