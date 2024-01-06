FROM ubuntu:18.10

# Close the interactive
ENV DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update  && \
    apt-get install -y apt-transport-https curl gpg xvfb libgtk2.0-0 libxss1 \
        libasound2 xauth x11-apps dbus git && \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get update && \
    apt-get install -y code

CMD code serve-web --host 0.0.0.0 --without-connection-token --accept-server-license-terms

EXPOSE 8080/tcp
