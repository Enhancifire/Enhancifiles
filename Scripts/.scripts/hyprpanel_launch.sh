#!/usr/bin/env bash

export LC_ALL=en_US.UTF-8

killall -9 hyprpanel

hyprpanel &

sleep 5

killall -9 mako

