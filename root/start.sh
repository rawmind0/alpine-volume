#!/usr/bin/env bash

SERVICE_UID=${SERVICE_UID:-"0"} 
SERVICE_GID=${SERVICE_GID:-"0"}
SERVICE_VOLUME=${SERVICE_VOLUME:-"/opt/tools"}
KEEP_ALIVE=${KEEP_ALIVE:-"0"}

chown -R ${SERVICE_UID}:${SERVICE_GID} ${SERVICE_VOLUME}
touch ${SERVICE_VOLUME}/.synced

echo `date` $ME - "${SERVICE_VOLUME} owned by uid:${SERVICE_UID} gid:${SERVICE_GID} exported ...."

if [ "x$KEEP_ALIVE" == "x1" ]; then
	trap "exit 0" SIGINT SIGTERM
	while :
	do
		echo `date` $ME - "I'm alive"
		sleep 600
	done
fi
exit 0
