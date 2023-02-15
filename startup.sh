#!/bin/bash

while ! nc -zw1 google.com 443; do sleep 2; done;

hostname | xargs -I {} curl -d "Sistema: {}.  User: chip" ntfy.sh/SECRET_CHANNEL
ip address | sed -rn 's/^.*inet (192\.([0-9]+\.){2}[0-9]+).*$/\1/p' | xargs -I {} curl -d "Sistema ONLINE. IP:{}" ntfy.sh/SECRET_CHANNEL

export TERM=linux
