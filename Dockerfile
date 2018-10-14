FROM osrf/ros:kinetic-desktop-full

RUN apt-get update && \
    apt-get install -y \
        ros-kinetic-gazebo-* \
        ros-kinetic-turtlebot ⁠\
        ros-kinetic-turtlebot-apps \
        ros-kinetic-turtlebot-interactions \
        ros-kinetic-turtlebot-simulator \
        ros-kinetic-turtlebot-msgs \
        ros-kinetic-kobuki ⁠\
        ros-kinetic-yujin-ocs \
        mesa-utils \
        binutils && \
    rm -rf /var/lib/apt/lists/*
