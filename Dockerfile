FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ENV APT_REPO http://ftp.jaist.ac.jp/pub/Linux/ubuntu/

RUN set -eux && \
    sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%${APT_REPO}%g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y curl git zsh
COPY .zshrc /root/.zshrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)" \
    chsh -s /bin/zsh
