FROM ubuntu:latest

# install linux packages
# - basic tools
# - python runtime
# - cleanup
RUN apt-get update -y && \
    apt-get upgrade -y && \ 
    apt-get install -y \
    git curl \
    python3 python3-pip python3-venv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# create python venv
RUN python3 -m venv /opt/.venv
# add venv to PATH to enable venv functionality
ENV PATH="/opt/.venv/bin:$PATH"

# add python dependencies for project
# for production a 'requirement.txt' needs to be created
RUN pip3 install "fastapi[standard]" --no-cache-dir