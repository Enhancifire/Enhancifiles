def power():
    from rofi_helper import prompt

    opt = ["Quit QTile", "Reboot", "Shutdown", "Suspend"]

    choice = prompt("Power Option", opt)

    print(opt[choice[0]])
