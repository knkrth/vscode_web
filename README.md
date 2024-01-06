# VSCode Web App Image

## About

This will start a docker container exposing a port where you can access Visual Studio Code (standard from Microsoft, latest version) from a browser. You can use any extension out of the VSCode Marketplace, no adaptions needed. 
This base image contains only git and VSCode. Feel free to derive from this image and create e.g. a Node.js or a Python development environment. 

## Build the image

If you want to build the docker image from scratch, Default `vscode_user` password is `app` change it [here](https://github.com/knkrth/vscode_web/blob/main/Dockerfile#L25) & use 
```
docker build -t "vscode_web_app" .
```

## Start the container

VSCode needs a directory on where to write settings and store installed extensions. Map this to a local volume using the -v flag, e.g. -v ~/vscode_web_settings:/home/vscode_user. 

You should also map a directory where your projects are stored. Example: -v ~/vscode-projects:/home/vscode_user/projects. 

Important: Make sure those lokal directories (~/vscode_web_settings, ~/vscode-projects) exist and are writable for user / groupd id!

```
docker run --name vscode_web_app -d -p 8080:8080 -v ~/vscode_web_settings:/home/vscode_user \
                                                  -v ~/vscode_web_projects:/home/vscode_user/projects vscode_web_app
```

Docker Compose: 
```
version: "3"
services:
  portainer:
    container_name: vscode_web_app
    image: vscode_web_app:latest
    ports:
        - 8080:8080
    volumes:
      - ~/vscode_web_settings:/home/vscode_user
      - ~/vscode_web_projects:/home/vscode_user/projects 
    restart: unless-stopped
```

## Setup git

Login to VSCode and then use 
```
git config --global user.name "John Doe"
git config --global user.email "johndoe@email.com"
```
to set your username and email. 
