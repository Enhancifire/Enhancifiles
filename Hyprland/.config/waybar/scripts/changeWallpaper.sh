#!/bin/bash

DIR=$HOME/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]} ]}

echo $DIR/$RANDOMPICS

swww query || swww init

# --transition-step 90 --transition-fps 90

swww img --transition-type center --transition-pos 0.354,0.000 --transition-step 180 $DIR/$RANDOMPICS
