# see https://github.com/gitpod-io/workspace-images
FROM gitpod/workspace-base:commit-f2d623ca9d270c2ce8560d2ca0f9ce71b105aff2

# install docker & docker-compose, stolen from gitpod/workspace-full
USER root

ARG DOCKER_COMPOSE_VERSION=v2.2.2

# Dazzle does not rebuild a layer until one of its lines are changed. Increase this counter to rebuild this layer.
ENV TRIGGER_REBUILD=0
# https://docs.docker.com/engine/install/ubuntu/
RUN curl -o /var/lib/apt/dazzle-marks/docker.gpg -fsSL https://download.docker.com/linux/ubuntu/gpg \
    && apt-key add /var/lib/apt/dazzle-marks/docker.gpg \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && install-packages docker-ce docker-ce-cli containerd.io

RUN curl -o /usr/bin/slirp4netns -fsSL https://github.com/rootless-containers/slirp4netns/releases/download/v1.1.12/slirp4netns-$(uname -m) \
    && chmod +x /usr/bin/slirp4netns

RUN mkdir -p /usr/local/lib/docker/cli-plugins \
    && curl -o /usr/local/lib/docker/cli-plugins/docker-compose -fsSL https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64 \
    && chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# get inotify-tools for live reload from phoenix
RUN install-packages inotify-tools

# user is gitpod by default but who knows that
USER gitpod

ARG ASDF_VERSION=v0.9.0

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} \
    && echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc

# install asdf plugins
COPY .tool-versions $HOME/
COPY gitpod/install-asdf-plugins.sh $HOME/
RUN $HOME/install-asdf-plugins.sh \
    && rm $HOME/install-asdf-plugins.sh

# install hex and rebar
COPY gitpod/install-mix-tooling.sh $HOME/
RUN $HOME/install-mix-tooling.sh \
    && rm $HOME/install-mix-tooling.sh $HOME/.tool-versions
