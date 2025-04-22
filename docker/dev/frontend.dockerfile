FROM ubuntu:latest

# update
RUN apt-get update -y && \
    apt-get upgrade -y

# install base dependencies
RUN apt-get install -y \
    git \
    curl

# install javascript dependencies
RUN apt-get install -y \
    npm

CMD ["sh", "-c", "cd /project/src_frontend && npm install && npm start"]
                   # /project/src_backend