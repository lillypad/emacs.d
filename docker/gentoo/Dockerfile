FROM gentoo/stage3-amd64:latest

RUN emerge --quiet --sync && \
	emerge --quiet app-admin/sudo \
		   dev-vcs/git \
	groupadd sudo && \
	echo "dockerci ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
	useradd -ms /bin/bash dockerci && \
	echo "dockerci:dockerci" | chpasswd && \
	usermod -a -G sudo dockerci
USER dockerci
WORKDIR /home/dockerci/
RUN mkdir -p .emacs.d
ADD . .emacs.d/
USER root
RUN chown -R dockerci:dockerci .emacs.d/
USER dockerci
WORKDIR /home/dockerci/.emacs.d/
RUN make gentoo
