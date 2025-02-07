#!/bin/env bash

killall -e mpvpaper
mpvpaper -vs -o "no-audio loop panscan=1" eDP-1 $HOME/.config/wallpapers/eDP-1 &
mpvpaper -vs -o "no-audio loop panscan=1" eDP-2 $HOME/.config/wallpapers/eDP-2 &
mpvpaper -vs -o "no-audio loop panscan=1" HDMI-A-1 $HOME/.config/wallpapers/HDMI-A-1 &
