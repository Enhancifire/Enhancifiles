from rofi import Rofi


def prompt(msg, options):
    """Selection Prompt
    Takes a List of Options and returns the selection"""

    r = Rofi()

    choice = r.select(str(msg), options)

    return choice
