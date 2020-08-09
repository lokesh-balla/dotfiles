#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
polybar primary -c ~/.config/polybar/config.ini &
polybar secondary -c ~/.config/polybar/config.ini &
polybar systray -c ~/.config/polybar/config.ini &
polybar clock -c ~/.config/polybar/config.ini &
polybar cpu -c ~/.config/polybar/config.ini &
polybar memory -c ~/.config/polybar/config.ini &
polybar uptime -c ~/.config/polybar/config.ini &