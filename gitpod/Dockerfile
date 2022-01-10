# see https://github.com/gitpod-io/workspace-images
FROM gitpod/workspace-base:commit-f2d623ca9d270c2ce8560d2ca0f9ce71b105aff2

# user is gitpod by default but who knows that
USER gitpod

ARG ASDF_VERSION=v0.9.0

# setup asdf-vm: https://asdf-vm.com/guide/getting-started.html
RUN git clone --depth 1 https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch ${ASDF_VERSION} && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc && \
    echo '. $HOME/.asdf/asdf.sh' >> $HOME/.profile

# install asdf plugins
COPY gitpod/install-asdf-plugins.sh $HOME/
RUN $HOME/install-asdf-plugins.sh && \
    rm $HOME/install-asdf-plugins.sh
