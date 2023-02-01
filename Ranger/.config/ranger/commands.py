from __future__ import (absolute_import, division, print_function)

from ranger.api.commands import Command
import os


class emptytrash(Command):
    """:empty

    Empties the trash
    """

    def execute(self):
        # HOME = os.environ['HOME']
        self.fm.run('trash-empty')


class nvim(Command):
    """:nvim

    Opens Current File/Folder in Neovim
    """

    def execute(self):
        CWD = self.fm.thisdir
        self.fm.run(f"kitty --detach nvim {CWD}")


class visual(Command):
    """:visual

    Opens Current File/Folder in Thunar
    """

    def execute(self):
        CWD = self.fm.thisdir
        self.fm.run(f"thunar {CWD} & disown")
