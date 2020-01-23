FROM gitpod/workspace-vnc-full

USER root

# Update apt repositories
RUN apt-get update

# Upgrade the image
RUN apt upgrade -y
RUN apt dist-upgrade -y

# Install yarn
RUN apt install -y yarnpkg

# Install yarn deps
USER gitpod
RUN cd /tmp && wget https://raw.githubusercontent.com/codesandbox/codesandbox-client/master/yarn.lock -O /tmp/yarn.lock && yarn
USER root

# Remove apt sources to clean up space
RUN rm -rf /var/lib/apt/lists/*

# Clean-up unneeded packages
RUN apt autoremove -y
