#!/bin/sh
# Refresh oh-my-tmux's @battery_* user options on a timer.
# Referencing #{battery_*} in the status bar instead would make oh-my-tmux
# prepend a #() call, and tmux 3.7 re-runs those on every status redraw.
tmux_conf=$1
socket=$2
interval=${3:-60}

while tmux -S "$socket" has-session 2>/dev/null; do
  cut -c3- "$tmux_conf" | sh -s _battery_info
  sleep "$interval"
done
