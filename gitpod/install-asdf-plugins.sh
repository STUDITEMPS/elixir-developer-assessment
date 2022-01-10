#!/bin/bash

# install and pin erlang: https://github.com/asdf-vm/asdf-erlang
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin update erlang c215f6b18b8f11debd097e700f62b5da62860419

# install and pin elixir: https://github.com/asdf-vm/asdf-elixir
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin update elixir 8d018f2fd2977d124c8a48af583d733fa0479c01

# install and pin nodejs: https://github.com/asdf-vm/asdf-nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin update nodejs ed343553166813b1ca37a187e44779659cd33ca2
