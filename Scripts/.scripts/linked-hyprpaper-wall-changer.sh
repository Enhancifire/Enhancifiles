#!/bin/env bash
DIR=$HOME/Wallpapers/Aesthetic/

# wofi window config (in %)
WIDTH=20
HEIGHT=30

PICS=($(ls ${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))

RANDOM_PIC=${PICS[ $RANDOM % ${#PICS[@]} ]}
RANDOM_PIC_NAME="${#PICS[@]}. random"


# WOFI STYLES
CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/wofi/colors"

## Wofi Command
wofi_command="wofi --show dmenu \
			--prompt choose...
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WIDTH% --height=$HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"

menu(){
    # Here we are looping in the PICS array that is composed of all images in the $DIR
    # folder
    for i in ${!PICS[@]}; do
        # keeping the .gif to make sue you know it is animated
        if [[ -z $(echo ${PICS[$i]} | grep .gif$) ]]; then
            printf "$i. $(echo ${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
        else
            printf "$i. ${PICS[$i]}\n"
        fi
    done

    printf "$RANDOM_PIC_NAME"
}

main() {
    choice=$(menu | ${wofi_command})

    # no choice case
    if [[ -z $choice ]]; then return; fi

    # random choice case
    if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
        if hyprctl activeworkspace | grep -q "eDP-1"; then
          rm $HOME/Wallpapers/Hyprland/wall1
          ln -s "${DIR}/${RANDOM_PIC}" $HOME/Wallpapers/Hyprland/wall1
          killall -e hyprpaper &
          sleep 1;
          hyprpaper &
          return
        elif hyprctl activeworkspace | grep -q "eDP-2"; then
          rm $HOME/Wallpapers/Hyprland/wall1
          ln -s "${DIR}/${RANDOM_PIC}" $HOME/Wallpapers/Hyprland/wall1
          killall -e hyprpaper &
          sleep 1;
          hyprpaper &
          return
        elif hyprctl activeworkspace | grep -q "HDMI"; then
          rm $HOME/Wallpapers/Hyprland/wall2
          ln -s "${DIR}/${RANDOM_PIC}" $HOME/Wallpapers/Hyprland/wall2
          killall -e hyprpaper &
          sleep 1;
          hyprpaper &
          return
        fi
    fi

    pic_index=$(echo $choice | cut -d. -f1)
    if hyprctl activeworkspace | grep -q "eDP-1"; then
      rm $HOME/Wallpapers/Hyprland/wall1
      ln -s "${DIR}/${PICS[$pic_index]}" $HOME/Wallpapers/Hyprland/wall1
      killall -e hyprpaper &
      sleep 1;
      hyprpaper &
      return
    elif hyprctl activeworkspace | grep -q "eDP-2"; then
      rm $HOME/Wallpapers/Hyprland/wall1
      ln -s "${DIR}/${PICS[$pic_index]}" $HOME/Wallpapers/Hyprland/wall1
      killall -e hyprpaper &
      sleep 1;
      hyprpaper &
      return
    elif hyprctl activeworkspace | grep -q "HDMI"; then
      rm $HOME/Wallpapers/Hyprland/wall2
      ln -s "${DIR}/${PICS[$pic_index]}" $HOME/Wallpapers/Hyprland/wall2
      killall -e hyprpaper &
      sleep 1;
      hyprpaper &
      return
    fi
}

# Check if wofi is already running
if pidof wofi >/dev/null; then
    killall wofi
    exit 0
else
    main
fi

# Uncomment to launch something if a choice was made
# if [[ -n "$choice" ]]; then
    # Restart Waybar
# fi
