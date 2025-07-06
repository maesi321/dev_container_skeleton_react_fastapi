FROM ubuntu:latest

# install linux packages
# - basic tools
# - react dependencies
# - cleanup
RUN apt-get update -y && \
    apt-get upgrade -y && \ 
    apt-get install -y \
    git curl \
    npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*