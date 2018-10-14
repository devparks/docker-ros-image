FROM osrf/ros:indigo-desktop-full

# Install all ROS Turtlebot stuffs
RUN apt-get update && apt-get upgrade -y && apt-get install -y ros-indigo-turtlebot ros-indigo-turtlebot-apps ros-indigo-turtlebot-interactions ros-indigo-turtlebot-simulator ros-indigo-kobuki-ftdi ros-indigo-rocon-remocon ros-indigo-rocon-qt-library ros-indigo-ar-track-alvar-msgs

# Setup workspace
RUN . /opt/ros/indigo/setup.sh && \
    mkdir -p ~/catkin_ws/src/ && \
    cd ~/catkin_ws/ && \
    catkin_make && \
    . ~/catkin_ws/devel/setup.bash

# Clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
