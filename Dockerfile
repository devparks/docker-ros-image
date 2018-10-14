FROM ros:kinetic-desktop-full-xenial

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-kinetic-gazebo-* \
  && rm -rf /var/lib/apt/lists/*
