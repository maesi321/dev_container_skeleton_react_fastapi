# Dev container skeleton with React and FastAPI
A skeleton project for developing React frontend and FastAPI backend with VS Code dev cointainer.

## Motivation
The motivation for this project was to learn about VS Code dev container and Docker. Maybe it will help someone as a stepping stone for their own project.

This project is far from being ready for production. Things like .env files, authentication, security, etc. are missing. There is also a lot of room for improvement in terms of performance.

## Resources
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/)
- [Docker-compose reference](https://docs.docker.com/reference/compose-file/)
- [VS Code dev container reference](https://code.visualstudio.com/docs/devcontainers/containers)
- [React quick start](https://react.dev/learn)
- [FastAPI quick start](https://fastapi.tiangolo.com/tutorial/)

## Setup
- Docker installed -> [Docker home page](https://www.docker.com/get-started/)
- (optional) grant Docker more resources to have a smooth dev experience
- VS Code installed -> [VS Code home page](https://code.visualstudio.com/)
- VS Code extension "Dev Containers" installed -> [Marketplace page](https://code.visualstudio.com/)
- this repo downloaded or cloned

## How to start
- open this repo in VS Code
- execute "Dev Containers: Reopen in Container"
![alt text](/docs/assets/image.png)
- the first opening takes a few minutes
- happy coding

## Encountered pitfalls
### Git functionalities in monorepo and VS Code workspace
To get Git working inside the container the whole monorepo needs to be mounted. With 'devcontainer.json' the visibility of different parts of the project can be defined with the property 'workspaceFolder'.

### Container shutsdown after start
If a container does not have a service running it shuts itself down automatically after finishing the last instruction. To prevent this something like 'CMD ["sh", "-c", "sleep infinity"]' can be used. In the case of this skeleton project it was not neccessary, the frontend and backend had a service running.

### Pylance does not detect python interpreter
If Pylance does not detect the correct interpreter VS Code can be pointed to the right one within 'devcontainer.json' and property 'settings'.

### FastAPI backend not reachable from outside container
With the CLI command 'fastapi dev' the IP address is per default set to '127.0.0.1'. To work within Docker the IP address needs to be set to '0.0.0.0'.

### FastAPI backend denies access with something like 'No "Access-Control-Allow-Origin"'
CORS needs to be enabled -> [CORS (Cross-Origin Resource Sharing)](https://fastapi.tiangolo.com/tutorial/cors/).

