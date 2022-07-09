#!/usr/bin/env bash
set -euo pipefail
nitrogen --restore &
flameshot &
nm-applet &
picom &
~/.screenlayout/lappy-layout.sh &


