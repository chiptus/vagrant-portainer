#!/bin/bash

# strict mode - based on http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

session="portainer-nomad"

tmux new-session -d -s "$session"

tmux send-key "sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO -config /vagrant/config.hcl" 'C-m'

tmux split-window -h

tmux send-keys 'sleep 10' Enter 'nomad acl bootstrap' 'C-m'

tmux attach-session -t $session