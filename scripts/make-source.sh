#!/bin/bash -e
mkdir -p "${1:?}"
echo 'title = "My New Hugo Site"' > "${1:?}/config.toml"
