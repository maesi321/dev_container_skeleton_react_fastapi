FROM ubuntu:latest

# update
RUN apt-get update -y && \
    apt-get upgrade -y

# install linux dependencies
RUN apt-get update -y && \ 
    apt-get install -y \
    git \
    curl \
    npm