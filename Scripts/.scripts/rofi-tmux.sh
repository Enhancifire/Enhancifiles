#!/usr/bin/python

import os
import subprocess


def get_active_sessions():

    result = subprocess.run(
        ['tmux', 'list-sessions'],
        capture_output=True,
        text=True,
    )

    sessions = []

    if result.returncode == 0:
        output = result.stdout.splitlines()
        for line in output:
            sessions.append(line.split(":")[0])
    else:
        print(result.stderr)

    return sessions


def invoke_wofi(sessions):
    CONFIG = "~/fs144/.config/wofi/config"
    STYLE = "~/fs144/.config/wofi/style.css"
    # COLORS = "~/fs144/.config/wofi/colors"
    # "--color", COLORS,
    # "--width=$WIDTH%", "--height=$HEIGHT%",
    # , "--prompt"

    session_string = "\n".join(sessions)

    wofi_command = ["wofi", "--show", "dmenu", "--conf", CONFIG, "--style", STYLE,
                    "--cache-file=/dev/null", "--hide-scroll", "--no-actions", "--matching=fuzzy"]
    # for session in sessions:
    #     wofi_command.append(session)

    result = subprocess.run(wofi_command, input=session_string,
                            capture_output=True, text=True,)

    if result.returncode == 0:
        output = result.stdout.splitlines()[0]
        launch_kitty(output)

    else:
        pass


def launch_kitty(session):
    kitty_cmd = ["kitty", "-e", "tmux", "-u",
                 "new-session", "-A", "-s", session]

    subprocess.Popen(kitty_cmd)


if __name__ == "__main__":
    sessions = get_active_sessions()
    invoke_wofi(sessions)
