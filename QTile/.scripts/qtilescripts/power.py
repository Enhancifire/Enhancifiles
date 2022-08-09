#! /usr/bin/env python
import subprocess


def create_rofi_helper():
    "Creates rofi object"
    from rofi import Rofi

    r = Rofi()
    return r


def confirm():
    "Confirms the Selection"
    r = create_rofi_helper()
    res = r.select("Are you sure?", ["y", "n"])

    if res[0] == -1:
        return False
    elif res[0] == 0:
        return True
    elif res[0] == 1:
        return False


def power_off():
    "Power off the Computer"

    res = confirm()
    if res:
        subprocess.run(["systemctl", "poweroff"])


def suspend():
    "Suspend and Lock the Computer"
    subprocess.run(["systemctl", "suspend"])
    subprocess.run(["betterlockscreen", "-l"])
    print("Suspended")


def restart():
    "Reboot the Computer"
    res = confirm()
    if res:
        subprocess.run(["systemctl", "reboot"])


def lock():
    "Lock using betterlockscreen"
    subprocess.run(["betterlockscreen", "-l"])


def test():
    "Test"

    print(confirm())


def main():
    r = create_rofi_helper()
    power_options = {
        "Lock": lock,
        "Power Off": power_off,
        "Suspend": suspend,
        "Reboot": restart,
    }
    power_options_list = [opt for opt in power_options]
    res = r.select("Power Option", power_options_list)
    if res[0] != -1:
        choice = power_options_list[res[0]]
        fun = power_options[choice]
        fun()

    else:
        pass


main()
