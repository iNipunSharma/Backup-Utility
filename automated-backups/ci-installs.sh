#!/usr/bin/env bash

set -eu

#BIN_DIR="$HOME/.local/bin"
#mkdir -p "$BIN_DIR"
#export PATH="$BIN_DIR:$PATH"

echo "Install Mongo Tools"
wget -q https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2004-x86_64-100.5.4.deb
sudo apt install ./mongodb-database-tools-*-100.5.4.deb

echo "Install awscli"
pip install --user awscli==1.16.29
