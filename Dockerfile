FROM ros:ros-kinetic-desktop-full

# install bootstrap tools
RUN apt-get update \
    && apt-get install --no-install-recommends -y ros-kinetic-gazebo-* \
    && rm -rf /var/lib/apt/lists/*
