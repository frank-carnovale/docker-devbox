FROM centos:latest

COPY builder.sh /
RUN /builder.sh

