#!/bin/bash
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &
open -g -a XQuartz
xhost + $IP

docker run -it \
	-e DISPLAY=$IP:0 \
	-e QT_X11_NO_MITSHM=1 \
	-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
	--privileged \
	osrf/ros:indigo-desktop-full

xhost - $IP
osascript -e 'quit app "XQuartz"'
kill $(ps -ef | awk '/[s]ocat/{print $2}')
