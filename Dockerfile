FROM centos:8

COPY build_?.sh /
COPY patches    /patches
COPY GO         /usr/local/bin
COPY devbox.sh  /etc/profile.d

RUN /build_1.sh
RUN /build_2.sh
RUN /build_3.sh
#RUN /build_4.sh

