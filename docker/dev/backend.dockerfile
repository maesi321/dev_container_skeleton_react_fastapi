FROM ubuntu:latest

# update
RUN apt-get update -y && \
    apt-get upgrade -y

# install base dependencies and tools
RUN apt-get install -y \
    git \
    curl

# install python dependencies   
RUN apt-get install -y \
    python3 \
    python3-pip \
    python3-venv

# create python venv
RUN python3 -m venv /opt/.venv
# add venv to PATH to enable venv functionality
ENV PATH="/opt/.venv/bin:$PATH"

# add python dependencies for project
# for production a 'requirement.txt' needs to be created
RUN pip3 install "fastapi[standard]" --no-cache-dir

# start of server
# explicit defined host as '0.0.0.0' for docker communication
CMD ["sh", "-c", "cd /project/src_backend && fastapi dev --host 0.0.0.0 --port 8000"]