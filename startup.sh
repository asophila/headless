#!/bin/bash

while ! nc -zw1 google.com 443; do sleep 2; done;

hostname | xargs -I {} curl -d "Sistema: {}.  User: chip" ntfy.sh/SECRET_CHANNEL
ip addr | grep "inet " | awk 'NR==2{print $2}' | cut -d/ -f1 | xargs -I {} curl -d "Sistema ONLINE. IP:{}" ntfy.sh/SECRET_CHANNEL

export TERM=linux
