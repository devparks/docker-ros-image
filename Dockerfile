FROM ros

RUN apt-get update && apt-get install -y nano

CMD [ "source /root/catkin_ws/devel/setup.bash" ]

