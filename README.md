# Dev container skeleton with React and FastAPI
A skeleton project for the development of React frontend and FastAPI backend with VS Code Dev Container.

## Motivation
The motivation for this project was to learn about VS Code Dev Container and Docker. Maybe it will help someone as a stepping stone for their own project.

This project is far from being production ready. It lacks things like .env files, authentication, security, etc. There is also a lot of room for improvement in terms of performance.

## Resources
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)
- [Docker-compose reference](https://docs.docker.com/reference/compose-file/)
- [VS Code dev container reference](https://code.visualstudio.com/docs/devcontainers/containers)
- [React quick start](https://react.dev/learn)
- [FastAPI quick start](https://fastapi.tiangolo.com/tutorial/)

## Other skeletons
- [Flutter and Spring](https://github.com/maesi321/dev_container_skeleton_flutter_spring)

## Mental model
The repo is a mono-repo and consists of following parts:
- src_backend: complete backend service with code and resources
- src_frontend: complete frontend service with code and resources
- docker, .devcontainer: defintion of dev-container workflow
- docs: space for project documentation (general, frontend, backend, etc)

The code is mounted via volume into the container. The container itself provides a development environment with the required dependency installed. 
When the dev container is started via VS Code the service itself needs to be started manually, the container self runs infinitly as long as IDE is running.

## Setup
- Docker installed -> [Docker homepage](https://www.docker.com/get-started/)
- (optional) grant Docker more resources to enable smooth development
- VS Code installed -> [VS Code homepage](https://code.visualstudio.com/)
- VS Code extension "Dev Containers" installed -> [Marketplace page](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
- downloaded or cloned this repo

## How to start
- open this repo in VS Code
- run "Dev Containers: Reopen in Container"
![alt text](/docs/assets/image.png)
- the first opening takes a few minutes
- happy coding (the service working on needs to be started manually)

## Encountered pitfalls
### Git functionalities in the monorepo and VS Code workspace
For Git to work within the container, the entire monorepo must be mounted. With "devcontainer.json" the visibility of different parts of the project can be defined with the property "workspaceFolder".

### Container shutdown after start
If a container has no service running, it shuts down automatically after the last command has finished. To prevent this, something like 'CMD ["sh", "-c", "sleep infinity"]' can be used. In the case of this skeleton project, this was not necessary as both the frontend and the backend had a service running.

### Pylance does not recognise the Python interpreter
If Pylance does not recognise the correct interpreter, VS code in 'devcontainer.json' and the 'settings' property can be referenced to the correct interpreter.

### FastAPI backend not accessible from outside the container
With the CLI command 'fastapi dev' the IP address is set to '127.0.0.1' by default. To work within Docker, the IP address must be set to '0.0.0.0'.

### FastAPI backend denies access with something like 'No "Access-Control-Allow-Origin"'
CORS must be enabled -> [CORS (Cross-Origin Resource Sharing)](https://fastapi.tiangolo.com/tutorial/cors/).

### Service is work-in-progress and does not compile
The first iteration did start the service currently working on when starting the dev-container. If the code results in a compile error
the container would shut down, thus it could not be worked on the code. The solution was to start the service manually instead. To archieve this the docker-compose inheritance mechanism 'extend' is used to create frontend or backend specific startups.
