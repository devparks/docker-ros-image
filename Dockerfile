FROM nvidia/opengl:1.1-glvnd-runtime-ubuntu14.04

SHELL ["/bin/bash", "-c"]

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

RUN sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

RUN sudo apt-get update && sudo apt-get install -y ros-indigo-desktop-full

RUN sudo rosdep init && rosdep update

# Install all ROS Turtlebot stuffs
RUN sudo apt-get upgrade -y && sudo apt-get install -y ros-indigo-turtlebot ros-indigo-turtlebot-apps ros-indigo-turtlebot-interactions ros-indigo-turtlebot-simulator ros-indigo-kobuki-ftdi ros-indigo-rocon-remocon ros-indigo-rocon-qt-library ros-indigo-ar-track-alvar-msgs

# Setup workspace
RUN . /opt/ros/indigo/setup.sh && \
    mkdir -p ~/catkin_ws/src/ && \
    cd ~/catkin_ws/ && \
    catkin_make && \
    . ~/catkin_ws/devel/setup.bash

# Clean-up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
