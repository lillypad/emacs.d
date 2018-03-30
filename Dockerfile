FROM ubuntu:17.10

RUN apt-get update -qq
RUN apt-get install -qq git make sudo software-properties-common
RUN echo "dockerci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN useradd -ms /bin/bash dockerci
RUN echo "dockerci:dockerci" | chpasswd
RUN adduser dockerci sudo
USER dockerci
WORKDIR /home/dockerci/
RUN mkdir -p .emacs.d
ADD . .emacs.d/
USER root
RUN chown -R dockerci:dockerci .emacs.d/
USER dockerci
WORKDIR /home/dockerci/.emacs.d/
RUN make ubuntu
