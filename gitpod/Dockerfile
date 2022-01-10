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

# place asdf and mix inside workspace so their artifacts are persisted by prebuilds
ARG ASDF_DATA_DIR_ARG="/workspace/asdf"
ENV ASDF_DATA_DIR=${ASDF_DATA_DIR_ARG}
ARG MIX_HOME_ARG="/workspace/mix"
ENV MIX_HOME=${MIX_HOME_ARG}

ARG ASDF_VERSION=v0.9.0

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc

ENV ASDF_ERLANG_VERSION=24.2
ENV ASDF_ELIXIR_VERSION=1.13.1
ENV ASDF_NODEJS_VERSION=16.13.1

# install asdf plugins
COPY gitpod/install-asdf-plugins.sh $HOME/
RUN $HOME/install-asdf-plugins.sh && \
    rm $HOME/install-asdf-plugins.sh
