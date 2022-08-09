#!/usr/bin/env python

import os
import subprocess


def ytmusic():
    subprocess.Popen(
        [
            "/usr/lib/brave-bin/brave",
            "--profile-directory=Default",
            "--app-id=cinhimbnkkaeohfgghhklpknlkffjgod",
        ]
    )


def firefox():
    subprocess.Popen(
        [
            "/usr/bin/firefox",
        ]
    )


def set_brightness():
    subprocess.call(
        [
            "brightnessctl",
            "set",
            "60%",
        ]
    )


def main():
    ytmusic()
    firefox()
    set_brightness()


main()
