#!/bin/bash

# activate asdf
. $HOME/.asdf/asdf.sh

# install hex and rebar
asdf exec mix local.hex --force
asdf exec mix local.rebar --force
