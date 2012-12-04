#!/bin/bash

PROTO_KEY="$1"
KEY=$(mclient --quiet get $1)

VMWARE_LIB_PATH=/usr/lib/vmware
ARBITRATOR=vmware-usbarbitrator
DAEMON=vmware-view-usbd

#Make sure we are authorized.
if [ "$KEY" = "view" ]; then
  #If so, launch daemons. 
  #(For view 1.6, they will detect if one is already running and
  #not launch another instance)
	$VMWARE_LIB_PATH/$ARBITRATOR
  $VMWARE_LIB_PATH/$DAEMON
else
  #To kill all abitrator instances, launch with
  #kill command
	$VMWARE_LIB_PATH/$ARBITRATOR --kill
  #To kill daemon send sigterm
  DAEMON_PID=$(pidof $DAEMON)
  if [ -n "$DAEMON_PID" ] ; then
    kill $DAEMON_PID
  fi
fi

return 0
