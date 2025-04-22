FROM ubuntu:latest

# update
RUN apt-get update -y && \
    apt-get upgrade -y

# install base dependencies and tools
RUN apt-get install -y \
    git \
    curl

# install javascript dependencies
RUN apt-get install -y \
    npm

# start of server    
CMD ["sh", "-c", "cd /project/src_frontend && npm install && npm start"]