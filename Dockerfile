FROM osrf/ros:indigo-desktop-full

RUN apt-get update && apt-get upgrade -y

RUN apt-get install ros-indigo-turtlebot ros-indigo-turtlebot-apps ros-indigo-turtlebot-interactions ros-indigo-turtlebot-simulator ros-indigo-kobuki-ftdi ros-indigo-rocon-remocon ros-indigo-rocon-qt-library ros-indigo-ar-track-alvar-msgs

RUN rm -rf /var/lib/apt/lists/*
