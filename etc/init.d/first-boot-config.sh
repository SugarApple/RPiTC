#!/bin/sh
### BEGIN INIT INFO
# Provides:          first-boot-config 
# Required-Start:    $syslog
# Required-Stop:
# Default-Start:     2
# Default-Stop:      
# Short-Description: Regenerate ssh host keys, change permission to man files
# Description:
### END INIT INFO

. /lib/lsb/init-functions

set -e

case "$1" in
  start)
    log_daemon_msg "RPi-TC fist boot config (in background)"
    nohup sh -c "rm -rf /etc/ssh/ssh_host_* && \
      yes | ssh-keygen -q -N '' -t dsa -f /etc/ssh/ssh_host_dsa_key && \
      yes | ssh-keygen -q -N '' -t rsa -f /etc/ssh/ssh_host_rsa_key && \
      yes | ssh-keygen -q -N '' -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
      service ssh restart && \
      chown -R man:root /var/cache/man && \
      update-rc.d -f first-boot-config.sh remove && \
      printf '\nfinished\n' " > /var/log/first_boot_config.log 2>&1 &
    log_end_msg $?
    ;;
  *)
    echo "Usage: $0 start" >&2
    exit 3
    ;;
esac
