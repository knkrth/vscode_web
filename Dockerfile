FROM ubuntu:20.04

# Close the interactive
ENV DEBIAN_FRONTEND noninteractive

EXPOSE 8080/tcp
ARG GID=1000
ARG UID=1000

RUN apt-get update && \
    apt-get upgrade && \
    apt-get -y install sudo wget gpg && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \
    apt -y install apt-transport-https && \
    apt update && \
    apt -y install git code && \
    groupadd --gid ${GID} vscode_group && \
    useradd --uid ${UID} --gid ${GID} -ms /bin/bash vscode_user && \
    chown -R ${GID}:${UID} /home/vscode_user

# "app" is the vscode_user password change it
Run echo "vscode_user:app" | chpasswd && adduser vscode_user sudo 
USER vscode_user

WORKDIR /home/vscode_user

RUN mkdir /home/vscode_user/projects

CMD code serve-web --host 0.0.0.0 --without-connection-token --accept-server-license-terms

