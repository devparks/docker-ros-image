FROM ros:kinetic-ros-base

# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    ros-kinetic-gazebo-* \
  && rm -rf /var/lib/apt/lists/*

CMD [ "gazebo" ]
